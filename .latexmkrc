# Use pdf mode. tex -> pdf
$pdf_mode = 1;

# Specify the main latex file.
@default_files = ('main.tex');

# Additional options for pdflatex
$pdflatex = "pdflatex -interaction=nonstopmode -shell-escape %O %S";

# Specify pdf viewer to use
$pdf_previewer = 'start evince';

# Use pdflatex recorder functionality
$recorder = 1;

# Report Errors in the database model
$biber = 'biber --validate-datamodel %O %S';

# Clean up .bbl fies
$bibtex_use = 2;

# Specify the output directory
$out_dir = 'build';

# Specify force mode. This is needed since /include is used in a folder.
$force_mode = 1;

# Specify the number or times to try and repeat processing. Since /include is
# used with build directory, an additional try will be needed for each
# subfolder used by \include.
$max_repeat = 8; # Was 5 originally

# Add extension used by packages to generated output list
push @generated_exts, "tdo";
push @generated_exts, "run.xml";

# Automatically convert svg files into pdf using inkscape
add_cus_dep('svg', 'pdf', 0, 'svg2pdf');
sub svg2pdf {
    system("inkscape --export-area-drawing --export-pdf=\"$_[0].pdf\" \"$_[0].svg\"");
}

# Cleanup includes custom dependencies
$cleanup_includes_cusdep_generated = 1;
