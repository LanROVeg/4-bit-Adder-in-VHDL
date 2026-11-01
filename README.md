# 4-bit ripple-carry adder

An ECE 2700 VHDL project at Weber State University.

`full_add` adds two bits and a carry-in. `add4` connects four full adders, passing
each carry-out into the next stage. The outputs are the low four sum bits and Cout.

## Run the tests

From Linux or WSL with Docker:

```bash
bash run_checks.sh
```

`tb_full` checks all **8** full-adder inputs. `tb_add4` checks all **512** X/Y/Cin
combinations against an arithmetic reference. Both stop on an assertion failure
and print a pass message when complete. GitHub Actions runs the same checks.

For Vivado 2024.2 or later, recreate the source project in PowerShell. Substitute
your installed path if needed:

```powershell
& 'C:\AMDDesignTools\2026.1\Vivado\bin\vivado.bat' -mode gui -source create_project.tcl
# Or run both benches automatically:
& 'C:\AMDDesignTools\2026.1\Vivado\bin\vivado.bat' -mode batch -source verification/vivado.tcl
```

The script sets VHDL-2008 and keeps generated files in `.vivado-work/<Vivado version>/`.
Use `add4` as synthesis top and `tb_full` or `tb_add4` as simulation top, then run all.
These are functional simulation checks; the wait intervals are not measurements of
hardware propagation delay. The original `Lab7.xpr` is also retained.
