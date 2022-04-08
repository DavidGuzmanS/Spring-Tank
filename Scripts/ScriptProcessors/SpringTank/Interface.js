Content.makeFrontInterface(650, 350);
Synth.deferCallbacks(true);


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
 
