component displayname="Option" entityname="SlatwallOption" table="SlatwallOption" persistent=true output=false accessors=true extends="slatwall.com.entity.BaseEntity" {
	
	// Persistant Properties
	property name="optionID" ormtype="string" lenth="32" fieldtype="id" generator="uuid" unsavedvalue="" default="";
	property name="optionCode" ormtype="string";
	property name="optionName" validateRequired ormtype="string";
	property name="optionImage" ormtype="string";
	property name="optionDescription" ormtype="string";
	property name="sortOrder" ormtype="integer";
	
	// Related Object Properties
	property name="optionGroup" cfc="OptionGroup" fieldtype="many-to-one" fkcolumn="optionGroupID";

	// Non-persistent Properties
	property name="imageDirectory" type="string" hint="Base directory for option images";

    public Option function init(){
	   setImageDirectory("#getSiteConfig().getAssetPath()#/images/Slatwall/meta/");
       return Super.init();
    }

    // Association management methods for bidirectional relationships
    public void function setOptionGroup(required OptionGroup OptionGroup) {
       variables.OptionGroup = arguments.OptionGroup;
       if(isNew() or !arguments.OptionGroup.hasOption(this)) {
           arrayAppend(arguments.OptionGroup.getOptions(),this);
       }
    }

    public void function removeOptionGroup(required OptionGroup OptionGroup) {
       var index = arrayFind(arguments.OptionGroup.getOptions(),this);
       if(index > 0) {
           arrayDeleteAt(arguments.OptionGroup.getOptions(),index);
       }
       
       structDelete(variables,"OptionGroup");
    }
	
	// Image Management methods
	
	public string function displayImage(string width="", string height="") {
		imageDisplay = "";
		if(this.hasImage()) {
			var fileService = getService("FileService");
			imageDisplay = fileService.displayImage(imagePath=getImagePath(), width=arguments.width, height=arguments.height, alt=getOptionName());
		}
		return imageDisplay;
	}
	
	public boolean function hasImage() {
		return len(getOptionImage());
	}
	
    public string function getImagePath() {
        return getImageDirectory() & getOptionImage();
    }
}