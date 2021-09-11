Content.makeFrontInterface(650, 350);
Synth.deferCallbacks(true);

//Authorization
include("Serials.js");

namespace Authorisation
{
    const var SerialInput = Content.getComponent("SerialInput");
    const var Description = Content.getComponent("Description");
    const var SerialStateLabel = Content.getComponent("SerialStateLabel");
    const var AuthorisationDialogue = Content.getComponent("AuthorisationDialogue");
    const var GlobalMute1 = Synth.getEffect("GlobalMute1");
    const var GlobalMute2 = Synth.getEffect("GlobalMute2");
    
    /** Checks if the serial input is valid and stores the result if successful. */
    inline function onSubmitButtonControl(component, value)
    {
        if(!value) // Just execute once
            return;
    
        local v = SerialInput.getValue();
        Console.print(v);
    
        // Checks if it's in the input
        if(serials.Data.contains(v))
        {
            Console.print("Serial number found");
            Description.set("text", "Valid serial number. Enjoy");
            local data = 
            {
                "Serial": v
            };
        
            // Stores the file to the hard drive. In HISE it will be the project folder
            // but in the compiled plugin it will use the parent directory to the 
            // user preset directory (which is usually the app data folder).
            Engine.dumpAsJSON(data, "../RegistrationInfo.js");
            
            setValidLicense(true);
        }
        else
        {
            Console.print("Invalid serial number");
            Description.set("text", "Invalid serial number. The number you supplied does not match");
            
            setValidLicense(false);
        }
    };

    Content.getComponent("SubmitButton").setControlCallback(onSubmitButtonControl);


    inline function setValidLicense(isValid)
    {
        // Do whatever you want to do here. I suggest a MIDI muter...
        GlobalMute1.setBypassed( 0 - isValid);
        GlobalMute2.setBypassed( 0 - isValid);
    
        if(isValid)
        {
            // Change this to any other visual indication...
            SerialStateLabel.set("bgColour", Colours.greenyellow);
            AuthorisationDialogue.set("text", "Authorized!");
            AuthorisationDialogue.set("textColour", Colours.greenyellow);
        }
        else
        {
            SerialStateLabel.set("bgColour", Colours.red);
            AuthorisationDialogue.set("text", "Unauthorized");
            AuthorisationDialogue.set("textColour", Colours.red);
        }
    }

    inline function checkOnLoad()
    {
        // Clear the input
        SerialInput.set("text", "");
        
        // Load the serial from the stored file
        local pData = Engine.loadFromJSON("../RegistrationInfo.js");
        Console.print("Checking serial");
    
        if(pData)    
        {
            local v = pData.Serial;
            Console.print("Restored serial: " + v);
        
            if(serials.Data.contains(v))
            {
                setValidLicense(true);
                return;
            }
        }
    
        setValidLicense(false);
    }

    // Call this on startup
    checkOnLoad();

}


// IR
const var convol = ["VOXREVERB1", "VOXREVERB2", "VOXREVERB3", "VOXREVERB4", "VOXREVERB5"];


Engine.loadAudioFilesIntoPool();

const var ConvolutionReverb1 = Synth.getAudioSampleProcessor("Convolution Reverb1");

inline function onKnob1Control(component, value)
{
	
    ConvolutionReverb1.setFile("{PROJECT_FOLDER}" + convol[value] + ".wav");
};

Content.getComponent("Tension").setControlCallback(onKnob1Control);

//Out Level
const var Out = Synth.getEffect("Out");
const var Out2 = Synth.getEffect("Out2");

inline function onOutControl(component, value)
{
    Out.setAttribute(Out.Gain, value);
    Out2.setAttribute(Out2.Gain, value);
};

Content.getComponent("Out").setControlCallback(onOutControl);


//Presets Panel
const var PresetPanel = Content.getComponent("PresetPanel");

inline function onPresetsControl(component, value)
{
	if (value == 1)
	    PresetPanel.showControl(true);
	if (value == 0)
	    PresetPanel.showControl(false);
};

Content.getComponent("Presets").setControlCallback(onPresetsControl);

//License Panel
const var LicensePanel = Content.getComponent("LicensePanel");

inline function onLicenseControl(component, value)
{
	if (value == 1)
	    LicensePanel.showControl(true);
	if (value == 0)
	    LicensePanel.showControl(false);
};

Content.getComponent("License").setControlCallback(onLicenseControl);

//Serial Finder Button

inline function onFindButtonControl(component, value)
{
		if (value)
	    Engine.openWebsite("https://drbrujosounds.com/my-account/view-license-keys/");
};

Content.getComponent("FindButton").setControlCallback(onFindButtonControl);

//Manual Button

inline function onManualControl(component, value)
{
		if (value)
	    Engine.openWebsite("https://drbrujosounds.com/wp-content/uploads/2021/07/Guitar-Spring-Reverb-Manual.pdf");
};

Content.getComponent("Manual").setControlCallback(onManualControl);
function onNoteOn()
{
	
}
 function onNoteOff()
{
	
}
 function onController()
{
	
}
 function onTimer()
{
	
}
 function onControl(number, value)
{
	
}
 