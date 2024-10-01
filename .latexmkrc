$out_dir = 'build';
$tex_dir = '.';
$pdflatex = 'pdflatex -interaction=nonstopmode';
$pdf_mode = 1;
$pdf_update_method = 0;

$pdf_command = 'pdflatex -interaction=nonstopmode %O';

add_cus_dep('nlo', 'nls', 0, 'makenlo2nls');

sub makenlo2nls {
    system("makeindex -s nomencl.ist -o $_[0].nls $_[0].nlo");
}
