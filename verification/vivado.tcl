set repo [file dirname [file dirname [file normalize [info script]]]]
source [file join $repo create_project.tcl]
foreach top {tb_full tb_add4} {
    set_property top $top [get_filesets sim_1]
    launch_simulation -simset sim_1 -mode behavioral
    set handle [open [file join $work adder4_demo.sim sim_1 behav xsim simulate.log] r]
    set output [read $handle]
    close $handle
    # Require the bench to finish all cases, not just launch successfully.
    if {![string match "*PASS: *exhaustive binary cases*" $output]} {
        error "$top did not reach its final pass report; check simulate.log"
    }
    close_sim
}
close_project
exit
