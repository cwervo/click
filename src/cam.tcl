#! /usr/bin/env tclsh8.6

proc get_available_webcams {} {
    set result [catch {
        exec swift src/cam.swift
    } output]
    
    if {$result != 0} {
        puts stderr "Error executing list_webcams: $output"
        return [list]
    }
    
    set webcams [split $output "\n"]
    set webcams [lmap cam $webcams {string trim $cam}]
    set webcams [lsearch -all -inline -not -exact $webcams ""]
    
    return $webcams
}

# Function to display menu and get user selection
proc select_webcam {webcams} {
    puts "Available webcams:"
    set index -1
    foreach cam $webcams {
        puts "[incr index]: $cam"
    }
    
    set selection -1
    while {$selection < 0 || $selection >= [llength $webcams]} {
        puts -nonewline "Select a webcam (0-[expr {[llength $webcams] - 1}]): "
        flush stdout
        gets stdin selection
        if {![string is integer $selection]} {
            set selection -1
        }
    }
    return [lindex $webcams $selection]
}

# Main procedure
proc main {} {
    puts "Webcam Selection Tool"
    
    set webcams [get_available_webcams]
    if {[llength $webcams] == 0} {
        puts "No webcams found."
        exit 1
    }
    
    set selected_webcam [select_webcam $webcams]
    puts "You selected: $selected_webcam"
}

# Run the main procedure
main
