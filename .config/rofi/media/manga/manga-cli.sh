#!/bin/bash

version="1.0.5"
old_ifs="${IFS}"
cache_dir="${HOME}/.cache/manga-cli"
dependencies=("ls" "cat" "curl" "sed" "awk" "tr" "du" "rm" "mkdir" "git" "diff" "patch" "img2pdf" "zathura")
github_source="https://raw.githubusercontent.com/7USTIN/manga-cli/master/manga-cli"

# Text colors
red="\033[1;31m"
green="\033[1;32m"
blue="\033[1;34m"
no_color="\033[0m" # Default text color

#########################
# Text output functions #
#########################

print_green() { # Print green text
	printf "${green}%s${no_color}\n" "${*}"
}

print_blue() { # Print blue text
	printf "${blue}%s${no_color}\n" "${*}"
}

print_red() { # Print red text to STDERR
	printf "${red}%s${no_color}\n" "${*}" >&2
}

print_list_item() { # Print text in blue (${1}) and the default color (${2})
	printf "${blue}%s${no_color} ${no_color}%s${no_color}\n" "[${1}]" "${2}"
}

prompt() { 
	# Print text in green (${1}) and blue (${2}) 
	printf "${green}%s${no_color} ${blue}%s${no_color}" "${1}" "${2}"

	# Prompt user and save user input to the variable 'reply'
	read -r reply 
}

######################
# Auxilary functions #
######################

show_help() {
	while IFS= read -r line; do
		printf "%s\n" "${line}"
	done <<-EOF
	
	manga-cli ${version} ( github.com/7USTIN/manga-cli )

	Bash script for reading mangas via the terminal

	Usage:
	  manga-cli [Options]

	Options:
	  -h, --help		Print this help page
	  -V, --version		Print version number
	  -u, --update		Fetch latest version from the Github repository
	  -f, --fullscreen	Open Zathura in fullscreen mode 
	  -l, --last-session	Open last session
	  -c, --cache-size	Print cache size (${cache_dir})
	  -C, --clear-cache	Clear cache (${cache_dir})

	EOF
}

show_version() {
	print_green "Version: ${version}"
}

open_pdf() { # Open PDF using Zathura and run it in the background
	if [[ "${zathura_auto_fullscreen}" == "true" ]]; then
		zathura --page=1 --mode="fullscreen" "${pdf_dir}" &
	else
		zathura --page=1 "${pdf_dir}" &
	fi
}

check_number_input() {
	min_num="${1}"
	max_num="${2}"
	input_num="${3}"

	if 	[[ ${input_num} -ge ${min_num} ]] &&
		[[ ${input_num} -le ${max_num} ]]	
	then
		return 1
	else
		print_red "Invalid selection"
		printf "\n"
		return 0
	fi
}

reset_ifs() {
	IFS="${old_ifs}"
}

###################
# Cache functions #
###################

show_cache_size() {
	# If cache_dir does not exist, create it
	if [[ ! -d "${cache_dir}" ]]; then
		mkdir --parents "${cache_dir}"
	fi

	cache_size="$(du -sh "${cache_dir}" | awk '{print $1}')"

	print_green "Cache size: ${cache_size} (${cache_dir})"
}

clear_cache() {
	show_cache_size

	prompt "Proceed with clearing the cache?" "[Y/N]: "

	# Convert user input to lowercase
	user_input="$(printf "%s" "${reply}" | tr "[:upper:]" "[:lower:]")"

	if [[ "${user_input}" == "y" ]]; then
		rm -r "${cache_dir:?}/"
		print_green "Cache successfully cleared"
	fi
}

cache_session() {
	# Save variables in session file
	printf '%s\n' \
		"${mod_manga_title}" "${selected_chapter_num}" "${manga_url}" "${chapter_urls[*]}" > \
		"${cache_dir}/session"
}

read_last_session() {
	if [[ ! -f "${cache_dir}/session" ]]; then
		print_red "ERROR: Session file not found"
	else
		session=($(cat "${cache_dir}/session"))
		
		mod_manga_title="${session[0]}"
		unset "session[0]"

		selected_chapter_num="${session[1]}"
		unset "session[1]"

		manga_url="${session[2]}"
		unset "session[2]"

		# Replace underscores with spaces
		manga_title="$(printf "%s" "${mod_manga_title}" | tr "_" " ")" 
		chapter_urls=("${session[@]}")
		chapter_count=${#chapter_urls[@]}
		chapter_url="${chapter_urls[${selected_chapter_num} - 1]}"

		# Update chapter list in the background 
		scrape_chapter_list &
	fi
}

####################
# Select functions #
####################

select_manga() {
	if [[ ${scraped_manga_count} -gt 1 ]]; then
		prompt "Select manga" "[1-${scraped_manga_count}]: "
		selected_manga_num=${reply}
	else
		print_green "Selected '${result_titles[0]}'"
		selected_manga_num=1
	fi

	check_number_input 1 "${scraped_manga_count}" "${selected_manga_num}"

	if [[ "${?}" == "0" ]]; then
		select_manga
	else
		manga_url="${result_urls[${selected_manga_num} - 1]}"
	fi
}

select_chapter() {
	printf "\e[1A\e[\\" # Delete last line

	if [[ ${chapter_count} -gt 1 ]]; then
		prompt "Select chapter" "[1-${chapter_count}]: "
		selected_chapter_num=${reply}
	else
		print_green "Selected first chapter"	
		selected_chapter_num=1
	fi

	check_number_input "1" "${chapter_count}" "${selected_chapter_num}"

	if [[ "${?}" == "0" ]]; then
		select_chapter
	else
		chapter_url="${chapter_urls[${selected_chapter_num} - 1]}"
	fi
}

####################
# Scrape functions #
####################

scrape_mangas() {
	# Replace spaces and hyphens with underscores
	search_query="$(printf "%s" "${manga_title_input}" | tr " -" "_")"
	
	scraped_results=$(
		curl --silent "https://manganato.com/search/story/${search_query}" | # Scrape URL
		sed --silent '/panel-search-story/,$p' | # Delete text before 'panel-search-story'
		sed --silent '/clear: both/q;p' # Delete text after 'clear: both'
	)
	
	IFS=$'\n'

	# Get titles from HTML 'alt' attribute
	result_titles=($(
		printf "%s" "${scraped_results}" |
		awk 'BEGIN{RS="\" />"; FS="alt=\""}NF>1{print $NF}'
	))
	scraped_manga_count="${#result_titles[@]}"

	# Get URLs from HTML 'href' attribute
	result_urls=($(
		printf "%s" "${scraped_results}" |
		awk 'BEGIN{RS="\" title="; FS="rel=\"nofollow\" href=\""}NF>1{print $NF}'
	))

	if [ "${scraped_manga_count}" == "0" ]; then
		print_red "No search results found"
		printf "\n"
		manga_title_input=
		main
	else
		printf "\n"
		print_blue "Found ${scraped_manga_count} result(s):"
	
		for ((i = 1; i < scraped_manga_count + 1; i++)); do
			print_list_item "${i}" "${result_titles[${i} - 1]}"
		done

		printf "\n"
	fi
}

scrape_chapter_list() {
	print_green "Fetching chapters..."

	IFS=$'\n'

	# Get chapter URLs in reversed order
	rev_chapter_urls=($(
		curl --silent "${manga_url}" | # Scrape URL
		sed --silent '/row-content-chapter/,$p' | # Delete text before 'row-content-chapter'
		sed --silent '/<\/ul>/q;p' | # Delete text after '</ul>'
		awk 'BEGIN{RS="\" title="; FS="<a rel=\"nofollow\" class=\"chapter-name text-nowrap\" href=\""}NF>1{print $NF}' # Get URLs from HTML 'href' attribute
	))

	chapter_urls=()

	# Reverse chapter URLs so they are in the correct order
	for i in "${rev_chapter_urls[@]}"; do
		chapter_urls=("$i" "${chapter_urls[@]}")
	done

	chapter_count="${#chapter_urls[@]}"

	if [[ "${chapter_count}" == "0" ]]; then
		printf "\e[1A\e[\\" # Delete last line
		print_red "No chapters found. Exiting..."
		exit 1
	fi
}

scrape_chapter() {
	if [[ -z "${mod_manga_title}" ]]; then
		manga_title="${result_titles[${selected_manga_num} - 1]}"
		mod_manga_title="$(printf "%s" "${manga_title}" | tr " " "_")" # Replace spaces with underscores
	fi

	image_dir="${cache_dir}/${mod_manga_title}/chapter_${selected_chapter_num}"
	pdf_dir="${cache_dir}/${mod_manga_title}/chapter_${selected_chapter_num}.pdf"
	
	clear
 
	if [[ ! -f "${pdf_dir}" ]]; then # If PDF file does not exist
		print_green "Fetching chapter ${selected_chapter_num}..."

		IFS=$'\n'

		chapter_image_urls=($(
			curl --silent "${chapter_url}" | # Scrape URL
			sed --silent '/container-chapter-reader/,$p' | # Delete text before 'container-chapter-reader'
			sed --silent '/max-height: 380px/q;p' | # Delete text after 'max-height: 380px'
			awk 'BEGIN{RS="\" alt="; FS="src=\""}NF>1{print $NF}' # Get image URLs from HTML 'src' attribute
		))

		printf "\n"
		print_blue "Downloading images..."

		i=0

		for image_src in "${chapter_image_urls[@]}"; do
			((i=i + 1))

			# Download image in the background
			curl \
				--silent \
				--create-dirs \
				--header 'Referer: https://readmanganato.com/' \
				--output "${image_dir}/${i}.jpg" \
				"${image_src}" &
		done

		wait # Wait until all images are downloaded
	fi
}

###################
# Other functions #
###################

search_manga() {
	if [ -z "${manga_title_input}" ]; then
		prompt "Search manga:"
		manga_title_input="${reply}"
	fi

	print_green "Searching for '${manga_title_input}'..."
}

input_controls() {
	print_blue "[Chapter ${selected_chapter_num}/${chapter_count}] ${manga_title}"
	
	if [[ ${selected_chapter_num} -lt ${chapter_count} ]]; then
		print_list_item "N" "Next chapter"
	fi

	if [[ ${selected_chapter_num} -gt 1 ]]; then	
		print_list_item "P" "Previous chapter"
	fi

	if [[ ${chapter_count} -gt 1 ]]; then
		print_list_item "S" "Select chapter"
	fi
	
	print_list_item "R" "Reopen current chapter"
	print_list_item "A" "Search another manga"
	print_list_item "Q" "Exit"

	printf "\n"
	prompt "Enter input:"
	user_input="$(printf "%s" "${reply}" | tr "[:upper:]" "[:lower:]")"

	case "${user_input}" in
		n)
			if [[ ${selected_chapter_num} -lt ${chapter_count} ]]; then
				((selected_chapter_num=selected_chapter_num + 1))
				chapter_url="${chapter_urls[${selected_chapter_num} - 1]}"
				open_chapter
			fi
			;;
		p)
			if [[ ${selected_chapter_num} -gt 1 ]]; then	
				((selected_chapter_num=selected_chapter_num - 1))
				chapter_url="${chapter_urls[${selected_chapter_num} - 1]}"
				open_chapter
			fi
			;;
		s)
			if [[ ${chapter_count} -gt 1 ]]; then
				select_chapter
				open_chapter
			fi
			;;
		r)
			open_pdf
			;;
		a)
			manga_title_input=
			mod_manga_title=
			clear
			main
			return 1
			;;
		q)
			clear
			exit 0
			;;
	esac
	
	clear
	input_controls
}

update_script() {
	print_green "Fetching Github repository..."

	# Get latest source code and compare it with this script
	changes="$(curl --silent "${github_source}" | diff -u "${0}" -)"

	if [[ -z "${changes}" ]]; then # If variable 'changes' is empty 
		print_green "Script is up to date"
	else
		if printf '%s\n' "${changes}" | patch --silent "${0}" -; then
			print_green "Script successfully updated"
		else
			print_red "ERROR: Something went wrong"
		fi
	fi
}

convert_imgs_to_pdf() {
	if [[ ! -f "${pdf_dir}" ]]; then # If PDF file does not exist
		print_blue "Converting images to PDF..."

		if [[ "${python_cmd_prefix}" == "true" ]]; then
			python3 -m img2pdf $(ls -v ${image_dir}/*.jpg) --output "${pdf_dir}"
		else
			img2pdf $(ls -v ${image_dir}/*.jpg) --output "${pdf_dir}"
		fi

		rm -r "${image_dir:?}/"
		clear
	fi
}

open_chapter() {
	scrape_chapter
	convert_imgs_to_pdf
	open_pdf
	cache_session
}

check_dependencies() {
	for dependency in "${dependencies[@]}"; do
		if ! command -v "${dependency}" &> /dev/null; then
			if ! pip3 show "${dependency}" &> /dev/null; then
				print_red "Missing dependency: '${dependency}'"
				exit_script=true
			else
				python_cmd_prefix=true
			fi
		fi
	done

	if [[ "${exit_script}" == "true" ]]; then
		exit 1
	fi
}

############
# Start up #
############

# Call 'reset_ifs' function when exiting script
trap reset_ifs EXIT

check_dependencies

main() {
	search_manga
	scrape_mangas
	select_manga
	scrape_chapter_list
	select_chapter
	open_chapter
	input_controls
}

while [[ "${1}" ]]; do
	case "${1}" in
		-h|--help)
			show_help
			exit 0
			;;
		-V|--version)
			show_version
			exit 0
			;;
		-u|--update)
			update_script
			exit 0
			;;
		-f|--fullscreen)
			zathura_auto_fullscreen=true
			;;
		-l|--last-session)
			open_last_session=true
			read_last_session
			;;
		-c|--cache-size)
			show_cache_size
			exit 0
			;;
		-C|--clear-cache)
			clear_cache
			exit 0
			;;
		*)	
			show_help
			exit 1
			;;
	esac

	shift
done

if [[ "${open_last_session}" == "true" ]]; then
	open_chapter
	input_controls
else 
	main
fi
