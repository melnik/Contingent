<?php
$PlanClient = new 
   SoapClient( 
       "http://195.19.33.1:8180/planWebservice/services/PlansService?wsdl" 
   );  //сервис предметов
class listDisBySpecialityFacultySemestr
   {
   function listDisBySpecialityFacultySemestr($sp,$fa,$se)
       {
       $this->spec=$sp;
       $this->faculty=$fa;
       $this->semestr=$se;    
       }
   var $spec;
   var $faculty="";
   var $semestr="";
   
   }

class listControlDisBySpecialityFacultySemestr
   {
   function listControlDisBySpecialityFacultySemestr($sp,$fa,$se)
       {
       $this->spec=$sp;
       $this->faculty=$fa;
       $this->semestr=$se;    
       }
   var $spec;
   var $faculty="";
   var $semestr="";
   
   }

class listDisByDisSubfaculty
   {
   function listDisByDisSubfaculty($str)
       {
           $this->subfaculty=$str;
       }
   var $subfaculty="";
   }

function toUTF($str){
	return iconv("KOI8-R","UTF-8",$str);
}

$Disc1=$PlanClient->listDisBySpecialityFacultySemestr(new listDisBySpecialityFacultySemestr($spec_code,toUTF($faculty),$semestr))->discipline;//получить список дисциплин
?>