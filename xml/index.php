<?php


$xp = new XsltProcessor();
$xsl=new DomDocument();
$xsl->load('cv_html.xsl');
$xp->importStylesheet($xsl);

$xml_doc=new DomDocument;
$xml_doc->load('cv.xml');

$xml_qr=new DomDocument;
$xml_qr->load('cv.xml');

$cv=simplexml_import_dom($xml_qr);

$mecard='MECARD:N:'.$cv->profile[0]->surname[0].','.$cv->profile[0]->name[0].';TEL:'.str_replace(' ','',$cv->profile[0]->phone[0]).';EMAIL:'.$cv->profile[0]->mail[0].';URL:'.$cv->update[0]['site'].';;';

//
    $PNG_TEMP_DIR = dirname(__FILE__).DIRECTORY_SEPARATOR.'temp'.DIRECTORY_SEPARATOR;
    
    //html PNG location prefix
    $PNG_WEB_DIR = 'temp/';

    include "phpqrcode/qrlib.php";    
    
    //ofcourse we need rights to create temp dir
    if (!file_exists($PNG_TEMP_DIR))
        mkdir($PNG_TEMP_DIR);
    
    
    $filename = $PNG_TEMP_DIR.'cv.png';
    $i=filemtime('cv.xml');
    $j=filemtime($filename);
    //processing form input
    //remember to sanitize user input in real-life solution !!!
    $errorCorrectionLevel = 'L';

    $matrixPointSize = 6;
    if($j-$i<0)
    {
    	QRcode::png($mecard, $filename, $errorCorrectionLevel, $matrixPointSize, 2);    
    }
    	QRcode::png($mecard, $filename, $errorCorrectionLevel, $matrixPointSize, 2);    
//
//echo '<img src="'.$PNG_WEB_DIR.basename($filename).'" />';  
if ($html = $xp->transformToXML($xml_doc)) {
      echo $html;
  } else {
      trigger_error('XSL transformation failed.', E_USER_ERROR);
  } // if 




?>
