$regexPageWidth = [regex]'(?<=paper-width\s*=\s*)\d*(?:\.\d*)?\\in';
$regexPageHeight = [regex]'(?<=paper-height\s*=\s*)\d*(?:\.\d*)?\\in';
$regexMargin = [regex]'(?<=bottom-margin\s*=\s*)\d*(?:\.\d*)?\\in';
$regexInnerMargin = [regex]'(?<=inner-margin\s*=\s*)\d*(?:\.\d*)?\\in';
$regexOuterMargin = [regex]'(?<=outer-margin\s*=\s*)\d*(?:\.\d*)?\\in';
$regexStaffSize = [regex]'(?<=#\(set-global-staff-size\s+)\d*(?:\.\d*)?';
$regexSecondStaff = [regex]'(?<="Garamond Premier Pro" \(/ )\d*(?:\.\d*)?';
$regexAbsFont85 = [regex]'(?<=\\abs-fontsize\s+#)8\.5';
$regexAbsFont15 = [regex]'(?<=\\abs-fontsize\s+#)15';
$regexAbsFont105 = [regex]'(?<=\\abs-fontsize\s+#)10\.5';
$regexAbsFont9 = [regex]'(?<=\\abs-fontsize\s+#)9';

$files = (ls -filter *.ly);
foreach ($_ in $files) {
  echo $_.Name
  $f = Get-Content $_ -Encoding UTF8;
  $f = $f -replace $regexPageWidth,"8.5\in";
  $f = $f -replace $regexPageHeight,"11\in";
  $f = $f -replace $regexStaffSize,"18";
  $f = $f -replace $regexSecondStaff,"18";
  $f = $f -replace $regexAbsFont15,"18";
  $f = $f -replace $regexAbsFont85,"10.5";
  $f = $f -replace $regexAbsFont105,"12.5";
  $f = $f -replace $regexAbsFont9,"11";
  
  $f = $f -replace $regexInnerMargin,"1\in";
  $f = $f -replace $regexOuterMargin,"0.5\in";
  $content = $f -replace $regexMargin,"0.25\in";
  $content | out-file ("8.5x11\" + $_.Name) -Encoding UTF8;
}