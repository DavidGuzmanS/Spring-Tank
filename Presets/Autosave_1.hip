Processor 
Type SynthChain ID Spring Tank Bypassed Gain 	      �?Balance 	        VoiceLimit 	      P@KillFadeTime 	      4@IconColour 0 packageName  BuildVersion �  EditorStates BodyShown 0 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors  Processor Type ScriptProcessor ID Interface Bypassed Script 4Content.makeFrontInterface(650, 350);
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
  EditorStates BodyShown 1 Visible 1 Solo 0 contentShown 1 onInitOpen 1  ChildProcessors   Content  Control type ScriptSlider id Wet value 	      � Control type ScriptSlider id Dry value 	      Y� Control type ScriptSlider id Low value 	   `  �> Control type ScriptSlider id High value 	   `  �> Control type ScriptSlider id 
PreDelay value 	      .@ Control type ScriptSlider id Damp value 	     �0� Control type ScriptSlider id Drive value 	         Control type ScriptSlider id Width value 	      Y@ Control type ScriptSlider id Out value 	   @ �> Control type ScriptButton id Bypass value 	         Control type ScriptSlider id 	Tension value 	       @ Control type ScriptButton id SubmitButton value 	         Control type ScriptButton id FindButton value 	         UIData  ContentProperties DeviceType 	Desktop Component type ScriptImage id Bg x 	        y 	        width 	     P�@height 	     �u@fileName  {PROJECT_FOLDER}Background.png  Component type ScriptSlider id Wet x 	     �U@y 	     �\@width 	      I@height 	      I@filmstripImage ${PROJECT_FOLDER}reverbtankknob.png numStrips 	      ?@isPluginParameter 1 pluginParameterName Wet processorId Convolution Reverb1 parameterId 	WetGain mode 	Decibel min 	      Y�max 	      �stepSize 	   ����?suffix  dB middlePosition 	      2� Component type ScriptSlider id Dry x 	      a@y 	     �\@width 	      I@height 	      I@filmstripImage ${PROJECT_FOLDER}reverbtankknob.png numStrips 	      ?@isPluginParameter 1 pluginParameterName Dry Level processorId Dry parameterId Gain mode 	Decibel min 	      Y�max 	        stepSize 	   ����?suffix  dB middlePosition 	      2�defaultValue 	      Y� Component type ScriptSlider id Low x 	     @g@y 	     �\@width 	      I@height 	      I@filmstripImage ${PROJECT_FOLDER}reverbtankknob.png numStrips 	      ?@isPluginParameter 1 pluginParameterName Low processorId Parametriq EQ1 parameterId Gain mode 	Decibel min 	      2�max 	      2@stepSize 	   ����?suffix  dB middlePosition 	         Component type ScriptSlider id High x 	     �m@y 	     �\@width 	      I@height 	      I@filmstripImage ${PROJECT_FOLDER}reverbtankknob.png numStrips 	      ?@isPluginParameter 1 pluginParameterName High processorId Parametriq EQ2 parameterId Gain mode 	Decibel min 	      2�max 	      2@stepSize 	   ����?suffix  dB middlePosition 	         Component type ScriptSlider id 
PreDelay x 	     �]@y 	      j@width 	     �@@height 	     �@@filmstripImage *{PROJECT_FOLDER}reverbtanklittleknob.png numStrips 	      ?@showValuePopup Below pluginParameterName Pre Delay processorId Convolution Reverb1 mode Time max 	      i@stepSize 	      �?suffix  ms middlePosition 	      I@isPluginParameter 1 parameterId 
Predelay  Component type ScriptSlider id Damp x 	      i@y 	      j@width 	     �@@height 	     �@@filmstripImage *{PROJECT_FOLDER}reverbtanklittleknob.png numStrips 	      ?@showValuePopup Below isPluginParameter 1 pluginParameterName Damp processorId Convolution Reverb1 parameterId 	Damping mode 	Decibel min 	      Y�max 	        stepSize 	   ����?suffix  dB middlePosition 	      2�defaultValue 	      2� Component type ScriptSlider id Drive x 	     �q@y 	      j@width 	     �@@height 	     �@@filmstripImage *{PROJECT_FOLDER}reverbtanklittleknob.png numStrips 	      ?@showValuePopup Below isPluginParameter 1 pluginParameterName Drive processorId Saturator1 parameterId WetAmount mode NormalizedPercentage suffix % middlePosition 	      �? Component type ScriptSlider id Width x 	     w@y 	      j@width 	     �@@height 	     �@@filmstripImage *{PROJECT_FOLDER}reverbtanklittleknob.png numStrips 	      ?@isPluginParameter 1 pluginParameterName Width processorId Out parameterId Width defaultValue 	      Y@max 	      i@middlePosition 	      Y@suffix % stepSize 	      �?showValuePopup Below  Component type ScriptSlider id Out x 	     �u@y 	     �\@filmstripImage &{PROJECT_FOLDER}reverbtankslider.png width 	      >@height 	      I@numStrips 	      ?@dragDirection 
Vertical isPluginParameter 1 pluginParameterName Out Level mode 	Decibel min 	      Y�max 	      .@stepSize 	   ����?suffix  dB middlePosition 	      2�showValuePopup Above  Component type ScriptButton id Bypass x 	     �v@y 	      ^@width 	      L@height 	      L@filmstripImage #{PROJECT_FOLDER}switch_toggle.png isPluginParameter 1 pluginParameterName Bypass processorId Spring Tank parameterId Bypass  Component type ScriptSlider id 	Tension x 	     P{@y 	      i@stepSize 	      �?filmstripImage ${PROJECT_FOLDER}VerticalSlider.png height 	      I@width 	     �b@numStrips 	      ?@middlePosition 	       @max 	      @dragDirection Horizontal defaultValue 	       @isVertical 0  Component 
type ScriptButton id Ledbutton x 	     �~@y 	      d@width 	      C@height 	      C@filmstripImage {PROJECT_FOLDER}Dual_LED.png saveInPreset processorId  linkedTo Bypass  Component type ScriptButton id 	Presets x 	      f@y 	     �s@width 	      I@height 	      =@filmstripImage "{PROJECT_FOLDER}presetbutton.png saveInPreset 0  Component 	type ScriptButton id Manual x 	     �l@y 	     �s@width 	     �D@height 	      =@filmstripImage "{PROJECT_FOLDER}manualbutton.png saveInPreset 0 isMomentary 1  Component type ScriptButton id 	License x 	     Ђ@y 	     �s@width 	     �D@height 	      =@filmstripImage #{PROJECT_FOLDER}licensebutton.png saveInPreset 0  Component type ScriptPanel id PresetPanel x 	      F@y 	      C@width 	     X�@height 	     �n@itemColour 3959422976 itemColour2 2365587456 Component type ScriptFloatingTile id ScriptFloatingTile1 x 	       @y 	      @width 	     ؀@height 	      m@parentComponent PresetPanel ContentType PresetBrowser bgColour 2818572288 itemColour 4294967295 itemColour2 4294951115 Data .{
  "ShowSaveButton": true,
  "ShowExpansionsAsColumn": false,
  "ShowFolderButton": true,
  "ShowNotes": false,
  "ShowEditButtons": true,
  "ShowFavoriteIcon": true,
  "NumColumns": 1,
  "ColumnWidthRatio": [
    0.3333333333333333,
    0.3333333333333333,
    0.3333333333333333
  ]
} Font Arial FontSize 	      (@ Component 	type ScriptPanel id LicensePanel x 	     �j@y 	     �M@width 	     �k@height 	     `h@itemColour 4278190080 itemColour2 2164260864 visible 0 Component 	type ScriptButton id SubmitButton x 	      R@y 	     �Y@width 	     @T@height 	      B@parentComponent LicensePanel filmstripImage "{PROJECT_FOLDER}submitbutton.png isMomentary 1  Component type ScriptLabel id SerialInput x 	      "@y 	     @P@width 	     �i@height 	      9@parentComponent LicensePanel text  bgColour 3707764735 itemColour 4294967295 itemColour2 4294967295 textColour 4280690214 fontStyle Italic  Component 	type ScriptLabel id Description x 	      (@y 	      a@width 	      i@height 	      H@parentComponent LicensePanel editable 0 text ?Invalid serial number. The number you supplied does not match  Component 
type ScriptLabel id SerialStateLabel x 	      "@y 	     @V@width 	     �i@height 	      $@parentComponent LicensePanel text  editable 0 bgColour 	  ��     Component type ScriptLabel id Enteryourserial x 	       @y 	     �@@width 	     �i@height 	      ?@parentComponent LicensePanel text  Enter your SERIAL NUMBER once. fontName Bebas fontSize 	      (@editable 0  Component type ScriptLabel id Find x 	      @y 	      @width 	     @j@height 	     �A@parentComponent LicensePanel text 'Click Here to find your Serial Number fontName Bebas Neue fontSize 	      .@textColour 4281051344  Component 	type ScriptButton id FindButton x 	        y 	        width 	     �k@height 	     �B@parentComponent LicensePanel isMomentary 1 filmstripImage !{PROJECT_FOLDER}transparent.png  Component 
type ScriptLabel id AuthorisationDialogue x 	      @y 	     �s@text Unauthorized editable 0 textColour 	  ��    fontSize 	      (@width 	     �Z@height 	      =@ Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors  Processor Type 	RouteFX ID Routing Matrix1 Bypassed EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix 	NumSourceChannels    Channel0     Send0    Channel1    Send1    Channel2 ����Send2 ����Channel3 ����Send3 ���� Processor Type SimpleGain ID Dry Bypassed Gain 	      Y�Delay 	        Width 	      Y@Balance 	        InvertPolarity 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Delay Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Width Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Pan Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix 	NumSourceChannels    Channel0 ����Send0 ����Channel1 ����Send1 ����Channel2    Send2 ����Channel3    Send3 ���� Processor Type Saturator ID Saturator1 Bypassed Saturation 	      �?WetAmount 	        PreGain 	        PostGain 	     �3�EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Saturation Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix 	NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ����Channel2 ����Send2 ����Channel3 ����Send3 ���� Processor Type Convolution ID Convolution Reverb1 Bypassed DryGain 	      Y�WetGain 	      �Latency 	        ImpulseLength 	      �?ProcessInput 	      �?UseBackgroundThread 	      �?Predelay 	      .@HiCut 	     ��@Damping 	     �0�FFTType 	        FileName  {PROJECT_FOLDER}VOXREVERB3.wav min     max �� loopStart     loopEnd     EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix 	NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ����Channel2 ����Send2 ����Channel3 ����Send3 ���� Processor 
Type 	CurveEq ID Parametriq EQ1 Bypassed NumFilters    Band0 	        Band1 	     q@Band2 	      �?Band3 	      �?Band4 	       @FFTEnabled EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix 	NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ����Channel2 ����Send2 ����Channel3 ����Send3 ���� Processor 
Type 	CurveEq ID Parametriq EQ2 Bypassed NumFilters    Band0 	        Band1 	   `f.�@Band2 	      �?Band3 	      �?Band4 	      @FFTEnabled EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix 	NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ����Channel2 ����Send2 ����Channel3 ����Send3 ���� Processor Type SimpleGain ID Out Bypassed Gain 	   �,_�>Delay 	        Width 	      Y@Balance 	        InvertPolarity 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Delay Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Width Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Pan Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix 	NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ����Channel2 ����Send2 ����Channel3 ����Send3 ���� Processor Type SimpleGain ID Out2 Bypassed Gain 	   �,_�>Delay 	        Width 	      Y@Balance 	        InvertPolarity 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Delay Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Width Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Pan Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix 	NumSourceChannels    Channel0 ����Send0 ����Channel1 ����Send1 ����Channel2    Send2 ����Channel3    Send3 ���� Processor Type SimpleGain ID GlobalMute1 Bypassed Gain 	      Y�Delay 	        Width 	      Y@Balance 	        InvertPolarity 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Delay Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Width Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Pan Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix 	NumSourceChannels    Channel0 ����Send0 ����Channel1 ����Send1 ����Channel2    Send2 ����Channel3    Send3 ���� Processor Type SimpleGain ID GlobalMute2 Bypassed Gain 	      Y�Delay 	        Width 	      Y@Balance 	        InvertPolarity 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Delay Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Width Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Pan Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix 	NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ����Channel2 ����Send2 ����Channel3 ����Send3 ���� Processor Type 	RouteFX ID Routing Matrix2 Bypassed EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix 	NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ����Channel2 ����Send2     Channel3 ����Send3     RoutingMatrix 	NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ����Channel2     Send2 ����Channel3    Send3 ���� macro_controls  macro name 	Macro 1 value 0.0 midi_cc -1  macro name 	Macro 2 value 0.0 midi_cc -1  macro name 	Macro 3 value 0.0 midi_cc -1  macro name 	Macro 4 value 0.0 midi_cc -1  macro name 	Macro 5 value 0.0 midi_cc -1  macro name 	Macro 6 value 0.0 midi_cc -1  macro name 	Macro 7 value 0.0 midi_cc -1  macro name 	Macro 8 value 0.0 midi_cc -1  MidiAutomation   MPEData Enabled  