/* VA Manager Dashboard Mapping File
 * Name: mapping_who.js
 * Date Developed : March 15th 2018
 * Version No: 1.0
 * Questionnaire: WHO VA 2016
 * Created by: Isaac Lya2
 * Email: ilyatuu@gmail.com
 * Description
 * This is a mapping file that uses smartVA ID's and return label and value. 
 * The input is a json structure from the ODK
 * */
function renderWHOVA(va_data_in_json, truncated=true){
	var va_arr = [];
	$.each(va_data_in_json,function(key,value){
		
		//if not truncated, then truncate
		if(!truncated){
			if(key.indexOf("_ID") > 0){
				key = key.substring(key.indexOf("_ID")+1, key.length);
			}
			if(key.indexOf("_AGE") > 0){
				key = key.substring(key.indexOf("_AGE")+1, key.length);
			}
			if(key.indexOf("_ADULT") > 0){
				key = key.substring(key.indexOf("_ADULT")+1, key.length);
			}
			if(key.indexOf("_CHILD") > 0){
				key = key.substring(key.indexOf("_CHILD")+1, key.length);
			}
			if(key.indexOf("_NEONATAL") > 0){
				key = key.substring(key.indexOf("_NEONATAL")+1, key.length);
			}
		}
		
		switch(key.toUpperCase()){
			case "ID10004":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During which season death occured";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10005_R":
				va_de = {};
		        va_de['id']="ID10005_1";
		        va_de['label']="Region of interview";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10005_D":
				va_de = {};
		        va_de['id']="ID10005_2";
		        va_de['label']="District of interview";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10005_V":
				va_de = {};
		        va_de['id']="ID10005_3";
		        va_de['label']="Village/Ward of interview";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10007":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Name of the VA Respondent";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10007_PHONE":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Phone number of the VA Respondent";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10008":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Respondent relationship to deceased";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10009":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Respondent live with the deceased in the period leading to her/his death";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10010":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Name of the VA Interviewer";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10010_PHONE":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Phone number of the VA Interviewer";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10012":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Date of the interview";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10017":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="First or given name(s) of the deceased?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10018":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Surname (or family name) of the deceased";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10019":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Sex of the deceased";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10020":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Is the date of birth known";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10021":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Date of birth";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10022":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Is the date of death known";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10023":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Date of death";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10051":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Collect civil registration data on the deceased";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10052":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Citizenship/nationality";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10053":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Ethnicity";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10054":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Place of birth";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10054_GROUP_ID10054_R":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Place of birth Region";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10054_GROUP_ID10054_W":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Place of birth District";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10054_GROUP_ID10054_K":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Place of birth Village";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10055":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Place of usual residence";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10056":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Place of normal residence 1 to 5 years before death";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10057":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Where did the death occured";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10057_R":
				va_de = {};
		        va_de['id']="ID10057_1";
		        va_de['label']="Region where death occurred";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10057_D":
				va_de = {};
		        va_de['id']="ID10057_2";
		        va_de['label']="District where death occurred";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10057_V":
				va_de = {};
		        va_de['id']="ID10057_3";
		        va_de['label']="Village where death occurred";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10057_DEATH_OUTSIDE":
				va_de = {};
		        va_de['id']="ID10057.0";
		        va_de['label']="Death outside the country";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10058":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Where did the deceased die";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10059":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Marital Status";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10060":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Date of marriage";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10061":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Name of father";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10062":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Name of mother";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10063":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Highest level of education";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10064":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Able to read and write";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10065":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Economic activity status prior to death";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10066":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="The primary kind of work";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10069":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Collect civil registration data";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10070":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Death registration number/certificate";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10071":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Date of registration";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10072":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Place of registration";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10073":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="National identification number of deceased";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10077":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Suffered from any injury or acciden that led to death";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10079":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was it a road traffic accident";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10080":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="What was his/her role in the road traffice accident";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10081":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="The counterpart that was hit during the road traffic accident";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10082":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Injured in a non-road transport accident";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10083":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Injured in a fall";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10084":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any poisoning";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10085":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Die of drowning";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10086":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Injured by a bite or sting by venomous animal";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10087":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Injured by an animal or insect (non-venomous)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10088":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="What was the animal/insect";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10089":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Injured by burns/fire";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10090":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Subjected to violence (suicide, homicide, abuse)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10091":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was he/she injured by a fire arm";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10092":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was (s)he stubbed, cut or pierced";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10093":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was (s)he strangled";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10094":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was (s)he injured by a blunt force?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10095":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was (s)he injured by a force of nature?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10096":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was it electrocution?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10097":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he encounter any other injury";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ID10098":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the injury accidental?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10099":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the injury or accident self-inflicted?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10100":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the injury or accident intentionally inflicted by someone else?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10104":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="The baby ever cry";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10105":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="The baby cry immediately after birth, even if only a little bit";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10106":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="How many minutes after birth did the baby first cry?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10107":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the baby stop being able to cry?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10108":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="How many hours before death did the baby stop crying?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10109":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the baby ever move?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10110":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the baby ever breathe?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10111":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the baby breathe immediately after birth, even a little?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10112":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the baby have a breating problem?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10113":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the baby given assistance to breathe at birth?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10114":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="If the baby didn't show any sign of life, was it born dead?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10115":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Were there any bruises or signs of injury on baby's body after the birth?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10116":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the baby’s body soft, pulpy and discoloured and the skin peeling away?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10351":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="How old was the baby when the fatal illness started";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10408":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Before the illness that led to death, was the baby or the child growing normally?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10120":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how long was (s)he ill before death? (DAYS)";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10122":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how long was (s)he ill before death? (WEEKS)";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10121":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how long was (s)he ill before death? (MONTHS)";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10123":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he die suddenly?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10125":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any diagnosis by a health professional of tuberculosis?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10126":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the HIV test ever positive?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10127":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any diagnosis by a health professional of AIDS?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10128":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he have a recent positive test by a health professional for malaria?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10129":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he have a recent negative test by a health professional for malaria?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10130":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any diagnosis by a health professional of dengue fever?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10131":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any diagnosis by a health professional of measles?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10132":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any diagnosis by a health professional of high blood pressure?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10133":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any diagnosis by a health professional of heart disease?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10134":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any diagnosis by a health professional of diabetes?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10135":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any diagnosis by a health professional of asthma?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10136":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any diagnosis by a health professional of epilepsy?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10137":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any diagnosis by a health professional of cancer?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10138":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any diagnosis by a health professional of Chronic Obstructive Pulmonary Disease (COPD)?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10139":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any diagnosis by a health professional of dementia?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10140":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any diagnosis by a health professional of depression?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10141":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any diagnosis by a health professional of stroke?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10142":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any diagnosis by a health professional of sickle cell disease?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10143":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any diagnosis by a health professional of kidney disease?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10144":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there any diagnosis by a health professional of liver disease?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10147":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he have a fever?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10148":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="How many days did the fever last?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10149":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the fever continue until death?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10150":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="How severe was the fever?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10151":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="What was the pattern of the fever?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10152":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he have night sweats?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10153":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he have a cough?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10154":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did (s)he have a cough?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10155":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the cough productive, with sputum?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10156":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the cough very severe?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10157":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he cough up blood?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10158":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he make a whooping sound when coughing?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10159":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he have any difficulty breathing?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10161":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did the difficulty breathing last?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10162":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many months did the difficulty breathing last?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10163":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many years did the difficulty breathing last?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10165":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the difficulty continuous or on and off?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10166":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did (s)he have fast breathing?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10167":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did the fast breathing last?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10168":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he have breathlessness?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10169":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did (s)he have breathlessness?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10170":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was (s)he unable to carry out daily routines due to breathlessness?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10171":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was (s)he breathless while lying flat?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10172":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did you see the lower chest wall/ribs being pulled in as the child breathed in?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10173"://This questions does not display. It is a multi select. Need to work on it
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death did his/her breathing sound like any of the";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10174":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he have chest pain?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10175":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the chest pain severe?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10176":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="How many days before death did (s)he have chest pain?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10178":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="How many minutes did the pain last?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10179":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="How many hours did the pain last?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10181":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he have more frequent loose or liquid stools than usual?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10182":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he have more frequent loose or liquid stools than usual?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10183":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="How many stools did the baby or child have on the day that loose liquid stools were most frequent?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10184":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="How many days before death did the frequent loose or liquid stools start?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10185":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the frequent loose or liquid stools continue until death?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10186":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="At any time during the final illness was there blood in the stools?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10187":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there blood in the stool up until death?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10188":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he vomit?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10189":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he vomit in the week preceding the death?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10190":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days before death did (s)he vomit?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10191":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there blood in the vomit?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10192":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the vomit black?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10193":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he have any belly (abdominal) problem?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10194":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he have belly (abdominal) pain?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10195":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the belly (abdominal) pain severe?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10196":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how long before death did (s)he have belly (abdominal) pain? (HOURS)";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10197":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how long before death did (s)he have belly (abdominal) pain? (DAYS)";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10198":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how long before death did (s)he have belly (abdominal) pain? (MONTHS)";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10199":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the pain in the upper or lower belly (abdomen)?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10200":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he have a more than usually protruding belly (abdomen)?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10201":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did (s)he have a more than usually protruding belly (abdomen)?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10202":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many months did (s)he have a more than usually protruding belly (abdomen)?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10203":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="How rapidly did (s)he develop the protruding belly (abdomen)?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10204":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he have any mass in the belly (abdomen)?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10205":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days before death did (s)he have a mass in the belly (abdomen)?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10206":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many months before death did (s)he have a mass in the belly (abdomen)?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10207":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he have a severe headache?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10208":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he have a stiff neck during illness that led to death?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10209":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days before death did (s)he have stiff neck?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10210":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did (s)he have a painful neck during the illness that led to death?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10211":
		        va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days before death did (s)he have a painful neck?";
		        va_de['value']=value;
		        va_arr.push(va_de);		        
		      break;
		      case "ID10212":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have mental confusion?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10213":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="For how many months did (s)he have mental confusion?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10214":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was (s)he unconscious during the illness that lead to death?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10215":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was (s)he unconscious for more than 24 hours before death?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10216":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="How many hours before death did unconsciousness start?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10217":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the unconsciousness start suddenly, quickly (at least within a single day)?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10218":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the unconsciousness continue until death?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10219":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have convulsions?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10220":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he experience any generalized convulsions or fits during the illness that led to death?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10221":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="For how many minutes did the convulsions last?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10222":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he become unconscious immediately after the convulsion?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10223":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have any urine problems?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10224":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he stop urinating?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10225":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he go to urinate more often than usual?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10226":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the final illness did (s)he ever pass blood in the urine?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10227":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have sores or ulcers anywhere on the body?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10228":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have sores?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10229":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the sores have clear fluid or pus?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10230":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have an ulcer (pit) on the foot?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10231":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the ulcer on the foot ooze pus?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10232":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="For how many days did the ulcer on the foot ooze pus?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10233":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the illness that led to death, did (s)he have any skin rash?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10234":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="For how many days did (s)he have the skin rash?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10235"://This is not showing multi select
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Where was the rash?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10236":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have measles rash (use local term)?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10237":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he ever have shingles or herpes zoster?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10238":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the illness that led to death, did her/his skin flake off in patches?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10239":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the illness that led to death, did he/she have areas of the skin that turned black?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10240":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the illness that led to death, did he/she have areas of the skin with redness and swelling?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10241":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the illness that led to death, did (s)he bleed from anywhere?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10242":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he bleed from the nose, mouth or anus?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10243":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have noticeable weight loss?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10244":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was (s)he severely thin or wasted?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10245":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the illness that led to death, did s/he have a whitish rash inside the mouth or on the tongue?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10246":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have stiffness of the whole body or was unable to open the mouth?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10247":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have puffiness of the face?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10248":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="For how many days did (s)he have puffiness of the face?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10249":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the illness that led to death, did (s)he have swollen legs or feet?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10250":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="How many days did the swelling last?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10251":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have both feet swollen?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10252":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have general puffiness all over hi(s)her body?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10253":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have any lumps?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10254":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have any lumps or lesions in the mouth?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10255":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have any lumps on the neck?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10256":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have any lumps on the armpit?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10257":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have any lumps on the groin?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10258":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was (s)he in any way paralysed?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10259":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did s(he have paralysis of only one side of the body?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10260": //this question is not showing, it is a multiselect
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Which were the limbs or body parts paralysed?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10261":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have difficulty swallowing?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10262":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="For how many days before death did (s)he have difficulty swallowing?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10263":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the difficulty with swallowing with solids, liquids, or both?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10264":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have pain upon swallowing?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10265":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have yellow discoloration of the eyes?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10266":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="For how many days did (s)he have the yellow discoloration?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10267":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did her/his hair change in color to a reddish or yellowish color?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10268":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he look pale (thinning/lack of blood) or have pale palms, eyes or nail beds?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10269":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have sunken eyes?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10270":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he drink a lot more water than usual?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10271":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the baby able to suckle or bottle-feed within the first 24 hours after birth?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10272":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby ever suckle in a normal way?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10273":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby stop suckling?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10274":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="How many days after birth did the baby stop suckling?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10275":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby have convulsions starting within the first 24 hours of life?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10276":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby have convulsions starting more than 24 hours after birth?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10277":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby's body become stiff, with the back arched backwards?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10278":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the illness that led to death, did the baby have a bulging or raised fontanelle? (ask only up to 18 months)";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10279":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the illness that led to death, did the baby have a sunken fontanelle? (ask only up to 18 months)";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10281":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the illness that led to death, did the baby become unresponsive or unconscious?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10282":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby become unresponsive or unconscious soon after birth, within less than 24 hours?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10283":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby become unresponsive or unconscious more than 24 hours after birth?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10284":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the illness that led to death, did the baby become cold to touch?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10285":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="How many days old was the baby when it started feeling cold to touch?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10286":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the illness that led to death, did the baby become lethargic, after a period of normal activity?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10287":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby have redness or pus drainage from the umbilical cord stump?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10288":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the illness that led to death, did the baby have skin ulcer(s) or pits?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10289":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the illness that led to death, did the baby have yellow skin, palms (hand) or soles (foot)?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10290":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby or infant appear to be healthy and then just die suddenly?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10294":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she have any swelling or lump in the breast?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10295":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she have any ulcers (pits) in the breast?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10296":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she ever have a period or menstruate?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10297":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she have vaginal bleeding in between menstrual periods?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10298":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the bleeding excessive?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10299":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did her menstrual period stop naturally because of menopause?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10300":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she have vaginal bleeding after cessation of menstruation?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10301":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was there excessive vaginal bleeding in the week prior to death?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10302":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="At the time of death was her period overdue?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10303":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="For how many weeks had her period been overdue?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10304":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she have a sharp pain in her belly (abdomen) shortly before death?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10305":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was she pregnant at the time of death?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10306":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she die within 6 weeks of delivery, abortion or miscarriage?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10307":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did this woman die more than 42 days after being pregnant or delivering a baby?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10307":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did this woman die more than 42 days after being pregnant or delivering a baby?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10308":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was this a woman who died less than 1 year after being pregnant or delivering a baby?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10309":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="For how many months was she pregnant?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10310":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Please confirm:When she died, she was NEITHER pregnant NOR had recently been pregnant NOR had recently delivered when she died - is that right?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10312":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she die during labour or delivery?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10313":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she die after delivering a baby?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10314":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she die within 24 hours after delivery?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10315":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she die within 6 weeks of childbirth?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10316":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she give birth to a live baby (within 6 weeks of her death)?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10317":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she die during or after a multiple pregnancy?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10318":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was she breastfeeding the child in the days before death?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10319":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="How many births, including stillbirths, did she/the mother have before this baby?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10320":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Had she had any previous Caesarean section?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10321":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During pregnancy, did she suffer from high blood pressure?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10322":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she have foul smelling vaginal discharge during pregnancy or after delivery?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10323":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the last 3 months of pregnancy, did she suffer from convulsions?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10324":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the last 3 months of pregnancy did she suffer from blurred vision?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10325":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did bleeding occur while she was pregnant";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10326":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was there vaginal bleeding during the first 6 months of pregnancy?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10327":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was there vaginal bleeding during the last 3 months of pregnancy but before labour started?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10328":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she have excessive bleeding during labour or delivery?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10329":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she have excessive bleeding after delivery or abortion?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10330":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the placenta completely delivered?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10331":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she deliver or try to deliver an abnormally positioned baby?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10332":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="For how many hours was she in labour?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10333":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she attempt to terminate the pregnancy?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10334":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she recently have a pregnancy that ended in an abortion (spontaneous or induced)?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10335":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she die during an abortion?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10336":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she die within 6 weeks of having an abortion?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10337":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Where did she give birth?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10338":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she receive professional assistance during the delivery?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10339":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Who delivered the baby?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10340":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did she have an operation to remove her uterus shortly before death?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10342":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the delivery normal vaginal, without forceps or vacuum?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10343":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the delivery vaginal, with forceps or vacuum?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10344":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the delivery a Caesarean section?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10347":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the baby born more than one month early?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10352":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="How many years old was the child when the fatal illness started?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10354":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the child part of a multiple birth?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10355":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the child the first, second, or later in the birth order?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10356":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Is the mother still alive?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10357":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the mother die during or after the delivery?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10358":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="How many months after the delivery did the mother die?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10359":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="How many days after the delivery did the mother die?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10360":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Where was the deceased born?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10361":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the mother receive professional assistance during the delivery? (ask only up to 1 year)";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10362":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="At birth, was the baby of usual size?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10363":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="At birth, was the baby smaller than usual, (weighing under 2.5 kg)?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10364":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="At birth, was the baby very much smaller than usual, (weighing under 1 kg)?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10365":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="At birth, was the baby larger than usual, (weighing over 4.5 kg)?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10366":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="What was the weight (in grammes) of the deceased at birth?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10367":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="How many months long was the pregnancy before the child was born? (ask only up to 1 year)";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10368":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Were there any complications in the late part of the pregnancy (defined as the last 3 months, before labour)? (ask only up to 1 year)";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10369":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Were there any complications during labour or delivery? (ask only up to 1 year)";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10370":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was any part of the baby physically abnormal at time of delivery? (for example:body part too large or too small, additional growth on body)?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10371":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby/child have a swelling or defect on the nback at the time of birth?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10372":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby/ child have a very large head at time of birth?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10373":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby/ child have a very small head at time of birth?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10376":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the baby moving in the last few days before the birth?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10376":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the baby moving in the last few days before the birth?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10377":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby stop moving in the womb before labour started?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10379":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="How many days before labour did you or the mother last feel the baby move? (maybe the respondent or health worker had examined the mother)";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10380":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="How many hours before labour did you or the mother last feel the baby move? (maybe the respondent or health worker had examined the mother)";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10382":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="How many hours did labour and delivery take?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10383":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the baby born 24 hours or more after the water broke?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10384":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the liquor foul smelling?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10385":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="What was the colour of the liquor when the water broke?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10387":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the delivery normal vaginal, without forceps or vacuum?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10388":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the delivery vaginal, with forceps or vacuum?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10389":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the delivery a Caesarean section?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10391":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did you/the mother receive any vaccinations since reaching adulthood including during this pregnancy?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10392":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="How many doses?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10393":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the mother receive tetanus toxoid (TT) vaccine?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10394":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="How many births, including stillbirths, did the baby's mother have before this baby?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10395":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During labour, did the baby's mother suffer from fever?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10396":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the last 3 months of pregnancy, labour or delivery, did the baby's mother suffer from high blood pressure?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10397":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby's mother have diabetes mellitus?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10398":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby's mother have foul smelling vaginal discharge during pregnancy or after delivery?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10399":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the last 3 months of pregnancy, labour or delivery, did the baby's mother suffer from convulsions?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10400":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="During the last 3 months of pregnancy did the baby's mother suffer from blurred vision?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10401":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby's mother have severe anemia?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10402":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby's mother have vaginal bleeding during the last 3 months of pregnancy but before labour started?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10403":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did the baby's bottom, feet, arm or hand come out of the vagina before its head?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10404":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the umbilical cord wrapped more than once around the neck of the child at birth?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10405":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the umbilical cord delivered first?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10406":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was the baby blue in colour at birth?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10411":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he drink alcohol?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10412":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he use tobacco?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10413":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he smoke tobacco (cigarette, cigar, pipe, etc.)?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10414":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="What kind of tobacco did (s)he use ?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10415":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="How many cigarettes did (s)he smoke daily?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10418":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he receive any treatment for the illness that led to death?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10419":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he receive oral rehydration salts?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10420":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he receive (or need) intravenous fluids (drip) treatment?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10421":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he receive (or need) a blood transfusion?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10422":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he receive (or need) treatment/food through a tube passed through the nose?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10423":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he receive (or need) injectable antibiotics?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10424":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he receive (or need) antiretroviral therapy (ART)?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10425":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have (or need) an operation for the illness?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10426":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he have the operation within 1 month before death?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10427":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was (s)he discharged from hospital very ill?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10428":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Had (s)he received immunization?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10429":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Do you have the child's vaccination card?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10430":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Can I see the vaccination card (note the vaccines the child received)?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10431":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Note vaccines here";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10432":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was care sought outside the home while (s)he had this illness?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10433":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Where or from whom did you seek care?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10434":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Record the name and address of any hospital, health center or clinic where care was sought";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10435":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did a health care worker tell you the cause of death?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10436":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="What did the health care worker say?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10437":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Do you have any health records that belonged to the deceased?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10438":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Can I see the health records?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10439":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Record the date of the most recent (last) visit";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10440":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Record the date of the last but one (second last) visit";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10441":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Record the date of the last note on the health records";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10442":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Record the weight (in kilogrammes) written at the most recent (last) visit";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10443":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Record the weight (in kilogrammes) written at the last but one (second last) visit";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10444":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Transcribe the last note on the health records";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10445":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Has the deceased’s (biological) mother ever been tested for HIV?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10446":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Has the deceased’s (biological) mother ever been told she had HIV/AIDS by a health worker?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10450":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="In the final days before death, did s/he travel to a hospital or health facility?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10451":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Did (s)he use motorised transport to get to the hospital or health facility?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10452":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Were there any problems during admission to the hospital or health facility";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10453":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Were there any problems with the way (s)he was treated (medical treatment, procedures, interpersonal attitudes, respect, dignity) in the hospital or health facility?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10454":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Were there any problems getting medications, or diagnostic tests in the hospital or health facility?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10455":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Does it take more than 2 hours to get to the nearest hospital or health facility from the deceased's household?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10456":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="In the final days before death, were there any doubts about whether medical care was needed?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10457":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="In the final days before death, was traditional medicine used?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10458":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="In the final days before death, did anyone use a telephone or cell phone to call for help?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10459":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Over the course of illness, did the total costs of care and treatment prohibit other household payments?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10462":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Was a death certificate issued?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10463":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Can I see the death certificate?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10464":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Record the immediate cause of death from the certificate (line 1a)";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10465":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Duration (Ia):";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10466":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Record the first antecedent cause of death from the certificate (line 1b)";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10467":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Duration (Ib):";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10468":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Record the second antecedent cause of death from the certificate (line 1c)";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10469":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Duration (Ic):";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10470":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Record the third antecedent cause of death from the certificate (line 1d)";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10471":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Duration (Id):";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10472":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Record the contributing cause(s) of death from the certificate (part 2)";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10473":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Duration (part2):";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10476"://Narrative section
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Narrative (Additional Information)";
			        va_de['value']=value;
			        va_arr.push(va_de);
			       		      	
		      break;
		      case "ID10477":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Are there any of the following words of interest mentioned in the above narrative?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10478":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Are there any of the following words of interest mentioned in the above narrative?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "ID10479":
			        va_de = {};
			        va_de['id']=key;
			        va_de['label']="Are there any of the following words of interest mentioned in the above narrative?";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "CONSENTED_HEALTH_INS_TZ001":
			        va_de = {};
			        va_de['id']="TZ001";
			        va_de['label']="Did the deceased have Health Insuarance?";
			        va_de['value']=value;
			        va_arr.push(va_de);
			  break;
		      case "CONSENTED_HEALTH_INS_TZ002":
			        va_de = {};
			        va_de['id']="TZ002";
			        va_de['label']="Which among the following Health Insuarances did the deceased have?";
			        va_de['value']=value;
			        va_arr.push(va_de);
			  break;
		      case "CONSENTED_HEALTH_INS_TZ003":
			        va_de = {};
			        va_de['id']="TZ003";
			        va_de['label']="Did the deceased use his/her Health Insuarance during his/her final illness?";
			        va_de['value']=value;
			        va_arr.push(va_de);
			  break;
		      case "CONSENTED_HEALTH_INS_TZ004":
			        va_de = {};
			        va_de['id']="TZ004";
			        va_de['label']="Which services did the Health Insuarance provide?";
			        va_de['value']=value;
			        va_arr.push(va_de);
			  break;
		      case "CONSENTED_HEALTH_INS_TZ005":
			        va_de = {};
			        va_de['id']="TZ005";
			        va_de['label']="Why did the deceased not use his/her health insuarance?";
			        va_de['value']=value;
			        va_arr.push(va_de);
			  break;
		      case "START_TIME":
			        va_de = {};
			        va_de['id']="TIME_START";
			        va_de['label']="Time at start of interview";
			        va_de['value']=value;
			        va_arr.push(va_de);
		        
			  break;
		      case "END":
			        va_de = {};
			        va_de['id']="TIME_END";
			        va_de['label']="Time at end of interview";
			        va_de['value']=value;
			        va_arr.push(va_de);
			  break;
		      case "AGE_ADULT":
		    	  	va_de = {};
			        va_de['id']="AGE_ADULT";
			        va_de['label']="Age entered in Years";
			        va_de['value']=value;
			        va_arr.push(va_de);
		      break;
		      case "AGE_IN_YEARS":
		    	  	va_de = {};
			        va_de['id']="AGE_IN_YEARS";
			        va_de['label']="Calculated Age in Years";
			        va_de['value']=value;
			        va_arr.push(va_de);
		      break;
		      case "AGE_IN_MONTHS":
		    	  	va_de = {};
			        va_de['id']="AGE_IN_MONTHS";
			        va_de['label']="Calculated age (Months after years)";
			        va_de['value']=value;
			        va_arr.push(va_de);
		      break;
		      case "AGE_CHILD_YEARS":
		    	  	va_de = {};
			        va_de['id']="AGE_CHILD_YEARS";
			        va_de['label']="Age in Years,Child";
			        va_de['value']=value;
			        va_arr.push(va_de);
		      break;
		      case "AGE_CHILD_MONTHS":
		    	  	va_de = {};
			        va_de['id']="AGE_CHILD_MONTHS";
			        va_de['label']="Age in Months after years, Child";
			        va_de['value']=value;
			        va_arr.push(va_de);
		      break;
		      case "AGE_IN_DAYS":
		    	  	va_de = {};
			        va_de['id']="AGE_IN_DAYS";
			        va_de['label']="Age in Days, Neonates";
			        va_de['value']=value;
			        va_arr.push(va_de);
		      break;
		      case "AGE_NEONATE_DAYS":
		    	  	va_de = {};
			        va_de['id']="AGE_NEONATE_DAYS";
			        va_de['label']="Age in Days, Neonates";
			        va_de['value']=value;
			        va_arr.push(va_de);
		      break;
		      case "AGE_NEONATE_HOURS":
		    	  	va_de = {};
			        va_de['id']="AGE_NEONATE_HOURS";
			        va_de['label']="Age in Hours after days, Neonates";
			        va_de['value']=value;
			        va_arr.push(va_de);
		      break;
		      case "GPS_LOCATION_LAT":
		    	  	va_de = {};
			        va_de['id']="GPS_LAT";
			        va_de['label']="GPS Latitude";
			        va_de['value']=value;
			        va_arr.push(va_de);
		      break;
		      case "GPS_LOCATION_LNG":
		    	  	va_de = {};
			        va_de['id']="GPS_LNG";
			        va_de['label']="GPS Longitude";
			        va_de['value']=value;
			        va_arr.push(va_de);
		      break;
		      case "GPS_LOCATION_ALT":
		    	  	va_de = {};
			        va_de['id']="GPS_ALT";
			        va_de['label']="GPS Altitude";
			        va_de['value']=value;
			        va_arr.push(va_de);
		      break;
		      case "GPS_LOCATION_ACC":
		    	  	va_de = {};
			        va_de['id']="GPS_ACC";
			        va_de['label']="GPS Accuracy";
			        va_de['value']=value;
			        va_arr.push(va_de);
		      break;
		      case "CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_CHILD":
		    	  	va_de = {};
			        va_de['id']="ID00000";
			        va_de['label']="Questionnaire type";
			        if(value==1){
			        	va_de['value']="CHILD";
			        	va_arr.push(va_de);
			        }
		      break;
		      case "CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_NEONATAL":
		    	  	va_de = {};
			        va_de['id']="ID00000";
			        va_de['label']="Questionnaire type";
			        if(value==1){
			        	va_de['value']="NEONATE";
			        	va_arr.push(va_de);
			        }
		      break;
		      case "CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_ADULT":
		    	  	va_de = {};
			        va_de['id']="ID00000";
			        va_de['label']="Questionnaire type";
			        if(value==1){
			        	va_de['value']="ADULT";
			        	va_arr.push(va_de);
			        }
		      break;
		      
		}
	});
	//Enable to display in console
	//console.log(va_arr);
	return va_arr;
}