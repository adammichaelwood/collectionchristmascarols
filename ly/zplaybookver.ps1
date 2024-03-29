$regexPageWidth = [regex]'(?<=paper-width\s*=\s*)\d*(?:\.\d*)?\\in';
$regexMargin = [regex] '(?<=(?:inner|outer)-margin\s*=\s*)\d*(?:\.\d*)?\\in';
$files = (ls -filter *.ly);
foreach ($_ in $files) {
  echo $_.Name
  $f = Get-Content $_ -Encoding UTF8;
  $content = $f -replace $regexPageWidth,"5.2734\in";
  $content = $content -replace $regexMargin,"0.0117\in";
  $content | out-file ("playbook\" + $_.Name) -Encoding UTF8;
}