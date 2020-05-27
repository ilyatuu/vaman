/* VA Manager Dashboard Mapping File
 * Name: mapping_smartva.js
 * Date Developed : March 15th 2018
 * Version No: 1.0
 * Questionnaire: SmartVA PHMRC
 * Created by: Isaac Lya2
 * Email: ilyatuu@gmail.com
 * Description
 * This is a mapping file that uses smartVA ID's and return label and value. 
 * The input is a json structure from the ODK
 * */

function renderSmartVA(va_data_in_json){
	var va_arr = [];
	$.each(va_data_in_json,function(key,value){
		switch(key.toUpperCase()){
			case "GEN_2_2":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Interviewer name";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_2_2C":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Interviewer phone";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_2_2D":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Interviewer Cell";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_VACODE":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="VA CODE";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_5_0":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="First name of the decease";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_5_0A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Surname of the decease";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_5_0C":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Other name(s) of the decease";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_5_2":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Sex of the decease";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_2_3A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="District";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
		    case "GEN_2_3R":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Region";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_2_3B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Sector";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_2_3C":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Cell";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_2_3D":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Village";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
		    case "GEN_2_3T":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Township";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_5_1E":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Is the decease Birth date known?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_5_1D":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="What date was the decease born?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_5_3E":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Is the date of death known?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_5_3D":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="What date did the decease die?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_5_4G":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="What was the last known age of the decease?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_5_4G":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="What was the last known age of the decease?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_5_4H":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Age in Years";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_5_4I":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Age in Months";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_5_4J":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Age in Days";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_5_5":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Where did the decease die?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_CAT":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Death Category";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_5_2C":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Natinal ID Number";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_4_1":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Respondent Name";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_4_2":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Respondent Sex";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_4_3":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Respondent relationship to decease";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_4_4":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Respondent age";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_6_3":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Death registration number";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_6_2E":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Death registration date";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_6_7":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="National ID Number";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_6_11A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="decease father's surname";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_6_11B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="decease father's firstname";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_6_11C":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="decease father's other names";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_6_12A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="decease mother's other names";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_6_12B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="decease mother's other names";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_6_12C":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="decease mother's other names";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "GEN_6_10":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Parent national ID number";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_5_1":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease suffer from any injury or accident that led to his/her death?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_5_2":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="What kind of injury or accident did he/she suffered?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_5_2A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Specific type of injury or accident";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_5_3":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the injury or accident self-inflicted?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_5_4":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the injury or accident intentionally inflicted by someone else?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_47":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the child suffer from any injury or accident that led to his/her death?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_48":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="What kind of injury or accident did the child suffer from?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_48A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Specified other type of injury";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_49":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the injury or accident intentionally inflicted by someone else?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_1_1A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the decease ever told by a health professional that he/she ever suffered from Asthma";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_1_1C":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the decease ever told by a health professional that he/she ever suffered from Cancer";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_1_1M":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the decease ever told by a health professional that he/she ever suffered from COPD (Chronic Obstructive Pulmonary Disease)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_1_1G":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the decease ever told by a health professional that he/she ever suffered from Diabetes";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_1_1H":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the decease ever told by a health professional that he/she ever suffered from Epilepsy";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_1_1I":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the decease ever told by a health professional that he/she ever suffered from Heart Disease";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_1_1D":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the decease ever told by a health professional that he/she ever suffered from Tuberculosis";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_1_1L":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the decease ever told by a health professional that he/she ever suffered from Stroke";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_1_1N":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the decease ever told by a health professional that he/she ever suffered from AIDS";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_2":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have fever?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_4":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How severe was the fever?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_5":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="What was the pattern of the fever?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_7":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have rushes?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_9":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Where was the rash located?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_9A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Where was the rash located? [other location, specified]";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_10":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have sores?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_11":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the sores have clear fluid or pus?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_13":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have an ulcer (pit) on the foot?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_14":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the ulcer ooze pus?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_15A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did the ulcer ooze pus? [specify units]";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_21":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have yellow discoloration of the eyes?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_22A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did the decease have the yellow discoloration?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_22B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many months did the decease have the yellow discoloration?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_25":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have puffiness of the face?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_26A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did the decease have puffiness of the face?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_26B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many months did the decease have puffiness of the face?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_27":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have general puffiness all over his/her body?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_29":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have a lump in the neck?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_30":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have a lump in the armpit?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_31":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have a lump in the groin?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_32":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have a cough?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_34":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the cough produce sputum?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_35":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have cough blood";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_36":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have difficulty breathing?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_43":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease experienced pain in the chest in the month preceding death?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_44":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How long did the pain last?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_47":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the deseased have more frequent loose or liquid stools than usual?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_50":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there blood in the stool?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_51":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there blood up until to his/her death?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_52":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease stop urinating?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_53":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease vomit in the week preceding the death?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_55":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there blood in the vomit";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_56":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the vomit black?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_57":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have difficulty swallowing?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_5A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did the decease have difficulty swallowing?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_58B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many months did the decease have difficulty swallowing?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_59":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the difficulty with swallowing with solids, liquids, or both?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_60":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have pain upon swallowing?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_61":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have belly pain?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_62A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many hours did the decease have belly pain?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_62B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did the decease have belly pain?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_6C":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many months did the decease have belly pain?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_63":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Where was the pain location";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_64":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have a more than usual protruding belly?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_65A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did the decease have a more than usual protruding belly?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_65B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how months days did the decease have a more than usual protruding belly?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_66":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How rapidly did the decease develop the protruding belly?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_67":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have any mass in the belly?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_68A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did the decease have any mass in the belly?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_68B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many months did the decease have any mass in the belly?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_72":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have stiff neck";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_73A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did the decease have stiff neck";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_73B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many months did the decease have stiff neck";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_74":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease experience a period of loss of consciousness?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_75":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How was the loss of consciousness?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_77":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did it continue until death?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_82":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have convulsions?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_83A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how long did the convulsion last?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_83B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many hours did the convulsion last?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_84":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the person become unconscious immediately after the convulsions?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_85":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the decease in any way paralyzed?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_2_87":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Which were the limbs or body parts paralyzed?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_1":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have any swelling or lump in the breast?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_2":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have any ulcers (pits) in the breast?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_3A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease ever have a period or menstrate?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_3":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Had periods stopped naturally because of menopause?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_4":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have vaginal bleeding after cessation of menstruation? (post menopausal)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_5":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have vaginal bleeding other than her period? (intermenstrual)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_6":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was there excessive vaginal bleeding in the week prior to death?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_7":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="At the time of death was her period overdue?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_8A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many weeks was her period overdue";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_9":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have a sharp pain in the belly shortly before death?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_10":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was she pregnant at the time of death?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_11A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many months was she pregnant?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_12":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did she die during an abortion?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_13":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did bleeding occur while she was pregnant?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_14":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did she have excessive bleeding during labor or delivery?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_15":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did she die during labor or delivery?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_16A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many hours was she in labor?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_17":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did she die within 6 weeks after having an abortion?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_18":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did she die within 6 weeks of childbirth?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_3_19":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did she have excessive bleeding after delivery or abortion?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_4_1":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease use tobacco?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_4_2":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Type of tobacco used";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_4_2A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Other type of tobacco";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_4_4A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Cigarrates per day";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_1":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was care sought outside the home while the decease had this illness?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_2":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Where did you seek care? (see all that apply)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_3":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Name and address of any hospital, health center or clinic where care was sought: ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_3B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="What did the health care worker say about cause of death";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_6B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Health records: First most recent year";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_6C":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Health records: First most recent month";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_6D":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Health records: First most recent day";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_6F":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Health records: Second most recent year";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_6G":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Health records: Second most recent month";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_6H":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Health records: Second most recent day";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_7A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Health records: Date of the last note: Year";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_7B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Health records: Date of the last note: Month";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_7C":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Health records: Date of the last note: Day";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_8":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Transcribed notes:";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_11":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Immediate cause of death from the certificate.";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_12":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="First underlying cause of death from the certificate.";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_13":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Second underlying cause of death from the certificate.";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_14":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Third underlying cause of death from the certificate.";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_6_15":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Contributing cause(s) of death from the certificate.";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_3":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Is the mother still alive?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_4":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the mother die during or after the delivery?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_5A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How long (in DAYS) after the delivery did the mother die?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_5B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How long (in MONTHS) after the delivery did the mother die?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_6":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Where was the deceased born?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_6A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Where was the deceased born (Other)?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_8A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="What was the weight of the deceased at birth? (in GRAMS)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_8B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="What was the weight of the deceased at birth? (in KILOGRAMS)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_7":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="At the time of the delivery what was the size of the deceased?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_11":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the baby born alive or dead?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_12":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the baby ever cry?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_13":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the baby ever move?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_14":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the baby ever breathe?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_16":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Were there any bruises or signs of injury on the baby's body at birth?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_17":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the baby's body (skin and tissue) pulpy? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_18":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was any part of the baby physically abnormal at time of delivery?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_19":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="The abnormalities were";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_19A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Other abnormalities were";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_20A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How old (in DAYS) was the baby/child when the fatal illness started?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_20B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How old (in MONTHS) was the baby/child when the fatal illness started?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_20C":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How old (in YEARS) was the baby/child when the fatal illness started?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_21A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How long (in DAYS) did the illness last? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_1_21B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How long (in MONTHS) did the illness last?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_2_1":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the late part of the pregnancy (defined as the last 3 months), labor, or delivery complicated by any of the following problems?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_2_4":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the baby moving in the last few days before the birth? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_2_8":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="What was the color of the liquor when the water broke?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_2_8A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="What was the color of the liquor when the water broke? [other location, specified]";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_2_10A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How much time (HOURS) did the labor and delivery take?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_2_15":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Who delivered the baby?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_2_15A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Who delivered the baby other?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_2_17":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Delivery type";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_2":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was any part of the baby physically abnormal at time of delivery?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_3":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="What were the abnormalities?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_3A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Other abnormality, specified";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_4":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the baby breathe immediately after birth?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_5":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the baby have difficulty breathing?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_6":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was anything done to try to help the baby breathe at birth? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_7":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the baby cry immediately after birth?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_8":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How long after birth did the baby first cry? (MARK ONE)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_9":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the baby stop being able to cry?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_11":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the baby able to suckle in a normal way during the first day of life?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_12":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the baby ever suckle in a normal way?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_17":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did the baby have difficult breathing? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_19A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did the difficult breathing last?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_20":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did the baby have fast breathing? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_22A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did the fast breathing last?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_23":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did the baby have indrawing of the chest?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_29":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did the baby become cold to touch?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_30A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="At what age (DAYS) did the baby start feeling cold to touch? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_32":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did the baby become lethargic, after a period of normal activity?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_33":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did the baby become unresponsive or unconscious? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_35":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did the baby have pus drainage from the umbilical cord stump?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_40":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did the baby have an area(s) of skin with redness and swelling?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_47":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did he/she have yellow skin?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_3_49":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the infant appear to be healthy and then just die suddenly? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_1":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did he/she have a fever?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_2A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How many days did the fever last?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_3":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the fever continue until death?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_4":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How severe was the fever?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_6":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did the decease have more frequent loose or liquid stools than usual? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_7A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How many stools did the decease have on the day that loose liquid stools were most frequent?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_9":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the frequent loose or liquid stools continue until death?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_12":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did the child have a cough?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_13A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did the cough last?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_14":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the cough very severe? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_16":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did the decease have difficult breathing?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_17A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did the difficult breathing last?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_18":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did ${gen_5_0} have fast breathing? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_19A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="For how many days did the fast breathing last?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_20":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did he/she have indrawing of the chest? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_23":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did his/her breathing sound like grunting? Grunting";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_25":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the deceased experience any generalized convulsions or fits during the illness that led to death?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_26":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the deceased unconscious during the illness that led to death?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_27":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How long before death did unconsciousness start?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_28":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have a stiff neck during the illness that led to death? (show photo)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_29":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have a bulging fontanelle during the illness that led to death? (show photo)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_30":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the month before he/she died, did the decease have a skin rash? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_33A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="How many days did the rash last?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_38":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did the decease skin flake off in patches?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_39":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the deceased hair change in color to a reddish or yellowish color?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_40":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Did the decease have a protruding belly?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_41":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did the decease suffer from 'lack of blood' or 'pallor'?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_42":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did the decease have swelling in the armpits?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_44":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did the decease bleed from anywhere?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_4_46":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="During the illness that led to death, did the decease have areas of the skin that turned black? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_0B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Health worker said this about the cause of death";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_2":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Where or from whom did you seek care?";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_3":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Record the name and address of any hospital, health center or clinic where care was sought:";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_6B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Most recent visit: Year";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_6C":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Most recent visit: Month";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_6D":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Most recent visit: Day";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_6F":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Most recent visit weight (GRAM)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_6G":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Most recent visit weight (KILOGRAM)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_7B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Second most recent visit: Year";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_7C":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Second most recent visit: Month";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_7D":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Second most recent visit: Day";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_7F":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Second most recent visit weight (GRAM)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_7G":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Second most recent visit weight (KILOGRAM)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_8A":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="last visit date (YEAR)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_8B":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="last visit date (MONTH)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_8C":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="last visit date (DAY)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_9":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Transcribe the note:";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_12":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Record the immediate cause of death from the certificate.";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_13":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Record the first underlying cause of death from the certificate.";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_14":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Record the second underlying cause of death from the certificate.";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_15":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Record the third underlying cause of death from the certificate.";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_16":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Record the contributing cause(s) of death from the certificate.";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_17":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Has the deceased's (biological) mother ever been tested for HIV? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_18":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Was the HIV test ever positive? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_5_19":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Has the deceased's (biological) mother ever been told she had AIDS by a health worker? ";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_7_1":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Chronic Kidney Disease";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_7_2":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Dialysis";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_7_3":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Fever";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_7_4":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Heart Attack (AMI)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_7_5":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Heart problem";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_7_6":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Jaundice";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_7_7":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned liver failure";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_7_8":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned malaria";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_7_9":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Pneumonia";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_7_10":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Renal (Kidney) Failure";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "ADULT_7_11":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned suicide";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_6_1":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Abdomen";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_6_2":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned cancer";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_6_3":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Dehydration";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_6_4":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned dengue fever";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_6_5":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Diarrhea";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_6_6":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned fever";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_6_7":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Heart Problems";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_6_8":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Jaundice (yellow skin or eyes)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_6_9":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Pneumonia";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "CHILD_6_10":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned rash";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "NEONATE_6_1":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Asphyxia (lack of oxygen)";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "NEONATE_6_2":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Incubator";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "NEONATE_6_3":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Lung Problems";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "NEONATE_6_4":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Pneumonia";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "NEONATE_6_5":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Preterm Delivery";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
			case "NEONATE_6_6":
				va_de = {};
		        va_de['id']=key;
		        va_de['label']="Open ended questions: Did the respondent mentioned Respiratory Distress";
		        va_de['value']=value;
		        va_arr.push(va_de);
		        break;
		        
		}
	});
	//Enable to display in console
	//console.log(va_arr);
	return va_arr;
}