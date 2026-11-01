# Recreate the lab from portable sources, keeping each Vivado release separate.
set repo [file dirname [file normalize [info script]]]
set work [file join $repo .vivado-work [version -short]]
if {[file exists [file join $work adder4_demo.xpr]]} {
    open_project [file join $work adder4_demo.xpr]
} else {
    create_project adder4_demo $work -part xc7a35tcpg236-1
    add_files [list [file join $repo Lab7.srcs/sources_1/new/full_add.vhd] [file join $repo Lab7.srcs/sources_1/new/add4.vhd]]
    add_files -fileset sim_1 [list [file join $repo Lab7.srcs/sim_1/new/tb_full.vhd] [file join $repo Lab7.srcs/sim_1/new/tb_add4.vhd]]
}
set_property target_language VHDL [current_project]
set_property file_type {VHDL 2008} [get_files *.vhd]
set_property top add4 [get_filesets sources_1]
set_property top tb_add4 [get_filesets sim_1]
set_property xsim.simulate.runtime all [get_filesets sim_1]
puts {Project ready. Choose tb_full or tb_add4 as simulation top and run all.}
