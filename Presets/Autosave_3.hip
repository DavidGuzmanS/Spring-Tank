Processor 
Type SynthChain ID BitMatrix Bypassed Gain 	      �?Balance 	        VoiceLimit 	      P@KillFadeTime 	      4@IconColour 0 packageName  BuildVersion �  EditorStates BodyShown 0 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors  Processor Type ScriptProcessor ID Interface Bypassed Script TContent.makeFrontInterface(320, 500);

//Authorization
include("Serials.js");

namespace Authorisation
{
    const var SerialInput = Content.getComponent("SerialInput");
    const var Description = Content.getComponent("Description");
    const var SerialStateLabel = Content.getComponent("SerialStateLabel");
    const var AuthorisationDialogue = Content.getComponent("AuthorisationDialogue");
    const var GlobalMute = Synth.getEffect("GlobalMute");
    
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
        GlobalMute.setBypassed( 0 - isValid);
    
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


//Preset Panel
const var presetsPanel = Content.getComponent("presetsPanel");

inline function onPresetsButtonControl(component, value)
{
	if (value == 1)
	    presetsPanel.showControl(true);
	else
	    presetsPanel.showControl(false);
};

Content.getComponent("PresetsButton").setControlCallback(onPresetsButtonControl);

//License Panel
const var licensePanel = Content.getComponent("licensePanel");

inline function onlicenseButtonControl(component, value)
{
	if (value == 1)
	    licensePanel.showControl(true);
	else
	    licensePanel.showControl(false);
};

Content.getComponent("licenseButton").setControlCallback(onlicenseButtonControl);


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
  EditorStates BodyShown 1 Visible 1 Solo 0 contentShown 1 onInitOpen 1  ChildProcessors   Content  Control type ScriptButton id bypass value 	      �? Control type ScriptSlider id blend value 	      Y� Control type ScriptSlider id bits value 	      �? Control type ScriptSlider id rate value 	   �p�? Control type ScriptSlider id cutoff value 	      �? Control type ScriptSlider id mod value 	         Control type ScriptSlider id speed value 	      �? Control type ScriptButton id modswitch value 	      �? UIData  ContentProperties DeviceType 	Desktop Component type ScriptImage id ScriptImage1 x 	        y 	        width 	      t@height 	     @@fileName {PROJECT_FOLDER}BitMatrix.png  Component 	type ScriptButton id bypass x 	     @`@y 	     v@width 	     @R@height 	     �R@filmstripImage '{PROJECT_FOLDER}guitatpedalswitch.png processorId BitMatrix parameterId 	Enabled  Component type ScriptSlider id blend x 	      O@y 	      J@width 	     �P@height 	     �P@filmstripImage ${PROJECT_FOLDER}darkpurpleknob.png numStrips 	      ?@processorId Simple Gain1 parameterId Gain min 	      Y�max 	        defaultValue 	      Y�mode 	Decibel middlePosition 	      2� Component type ScriptSlider id bits x 	     @_@y 	      J@width 	     �P@height 	     �P@filmstripImage ${PROJECT_FOLDER}darkpurpleknob.png numStrips 	      ?@processorId 
Degrade1 parameterId Quant defaultValue 	      �? Component type ScriptSlider id rate x 	     �g@y 	      J@width 	     �P@height 	     �P@filmstripImage ${PROJECT_FOLDER}darkpurpleknob.png numStrips 	      ?@processorId 
Degrade1 parameterId Rate defaultValue 	   @33�?mode 
Discrete max 	   ����?min 	   ����? Component type ScriptSlider id cutoff x 	      P@y 	      a@width 	     �P@height 	     �P@filmstripImage ${PROJECT_FOLDER}darkpurpleknob.png numStrips 	      ?@processorId 
Degrade1 parameterId 
PostFilt defaultValue 	      �? Component 
type ScriptSlider id mod x 	     �_@y 	      a@width 	     �P@height 	     �P@filmstripImage ${PROJECT_FOLDER}darkpurpleknob.png numStrips 	      ?@processorId LFO Modulator1 parameterId Intensity  Component type ScriptSlider id speed x 	     �g@y 	      a@width 	     �P@height 	     �P@filmstripImage ${PROJECT_FOLDER}darkpurpleknob.png numStrips 	      ?@mode Frequency min 	      �?max 	      D@suffix  Hz middlePosition 	      $@defaultValue 	       @processorId LFO Modulator1 parameterId Frequency  Component 	type ScriptButton id modswitch x 	      ^@y 	     @j@width 	      U@height 	     �S@filmstripImage #{PROJECT_FOLDER}switch_toggle.png processorId LFO Modulator1 parameterId Bypass  Component 
type ScriptButton id ScriptButton1 x 	     �h@y 	     �v@width 	      D@height 	     �C@filmstripImage {PROJECT_FOLDER}Dual_LED.png saveInPreset processorId  linkedTo bypass  Component type ScriptButton id licenseButton x 	     `q@y 	     P}@width 	      E@height 	      ?@saveInPreset 0 filmstripImage #{PROJECT_FOLDER}licensebutton.png  Component type ScriptButton id PresetsButton x 	     �e@y 	     P}@width 	      I@height 	      ?@saveInPreset 0 filmstripImage "{PROJECT_FOLDER}presetbutton.png  Component 
type ScriptPanel id presetsPanel x 	     �E@y 	     �A@width 	     �m@height 	     �y@bgColour 
16777215 itemColour 4278190080 itemColour2 2348810240 visible Component type ScriptFloatingTile id FloatingTile1 x 	      @y 	      @parentComponent presetsPanel width 	     @l@height 	     �x@ContentType PresetBrowser bgColour 2667577344 itemColour 4292710655 itemColour2 4294951115 Data .{
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
} Font Arcade  Component 
type ScriptPanel id licensePanel x 	     �E@y 	     �A@width 	     �m@height 	     �y@bgColour 
16777215 itemColour 4278190080 itemColour2 2348810240 visible Component type ScriptLabel id enter x 	      @y 	      Y@parentComponent licensePanel fontName ArcadeClassic text ENTER YOUR SERIAL NUMBER ONCE width 	     �l@height 	     �C@fontSize 	      1@editable 0  Component 	type ScriptLabel id SerialInput x 	      @y 	      `@parentComponent licensePanel text  bgColour 3690987519 width 	     �k@height 	      @@ Component 
type ScriptLabel id SerialStateLabel x 	      @y 	      d@parentComponent licensePanel editable 0 width 	     `k@height 	      $@text  bgColour 	  ��     Component 	type ScriptLabel id Description x 	      0@y 	     �m@parentComponent licensePanel width 	     @j@height 	      L@text  editable 0  Component 
type ScriptButton id SubmitButton x 	     @S@y 	     �h@parentComponent licensePanel isMomentary 1 filmstripImage "{PROJECT_FOLDER}submitbutton.png width 	      U@height 	     �B@saveInPreset 0  Component 
type ScriptLabel id AuthorisationDialogue x 	     �k@y 	     @}@width 	     �M@height 	      =@editable 0 fontSize 	      $@text Unauthorized textColour 	  ��     Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 1 Solo 0 Folded 0  ChildProcessors  Processor Type 	RouteFX ID Routing Matrix1 Bypassed EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix 	NumSourceChannels    Channel0     Send0    Channel1    Send1    Channel2 ����Send2 ����Channel3 ����Send3 ���� Processor Type SimpleGain ID Simple Gain1 Bypassed Gain 	      Y�Delay 	        Width 	      Y@Balance 	        InvertPolarity 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Delay Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Width Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Pan Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix 	NumSourceChannels    Channel0 ����Send0 ����Channel1 ����Send1 ����Channel2    Send2 ����Channel3    Send3 ���� Processor 	Type 	Degrade ID 
Degrade1 Bypassed Headroom 	   `ff�?Quant 	      �?Rate 	   �p�?PostFilt 	      �?Non-Lin 	    �G�?Output 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID FX Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type LFO ID LFO Modulator1 Bypassed Intensity 	        Frequency 	      �?FadeIn 	     @�@WaveformType 	      �?Legato 	      �?TempoSync 	        SmoothingTime 	      @LoopEnabled 	      �?PhaseOffset 	        CustomWaveform  StepData [64....f+....9C...3O...f+....9C...3O...f+....9C...3O...f+....9C...3O...f+....9C...3O...f+. EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID LFO Intensity Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID LFO Frequency Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix 	NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ����Channel2 ����Send2 ����Channel3 ����Send3 ���� Processor Type SimpleGain ID GlobalMute Bypassed Gain 	      Y�Delay 	        Width 	      Y@Balance 	        InvertPolarity 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Delay Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Width Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Pan Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix 	NumSourceChannels    Channel0 ����Send0 ����Channel1 ����Send1 ����Channel2    Send2 ����Channel3    Send3 ���� Processor Type 	RouteFX ID Routing Matrix2 Bypassed EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix 	NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ����Channel2 ����Send2     Channel3 ����Send3     Processor Type SineSynth ID Sine Wave Generator1 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      p@KillFadeTime 	      4@IconColour 0 OctaveTranspose 	        SemiTones 	        UseFreqRatio 	        CoarseFreqRatio 	      �?FineFreqRatio 	        SaturationAmount 	   ��(�?EditorStates BodyShown 1 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor 	Type SimpleEnvelope ID DefaultEnvelope1 Bypassed Monophonic 	        Retrigger 	      �?Intensity 	      �?Attack 	      @Release 	      $@LinearMode 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Attack Time Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� RoutingMatrix 	NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ����Channel2     Send2 ����Channel3    Send3 ���� macro_controls  macro name 	Macro 1 value 0.0 midi_cc -1  macro name 	Macro 2 value 0.0 midi_cc -1  macro name 	Macro 3 value 0.0 midi_cc -1  macro name 	Macro 4 value 0.0 midi_cc -1  macro name 	Macro 5 value 0.0 midi_cc -1  macro name 	Macro 6 value 0.0 midi_cc -1  macro name 	Macro 7 value 0.0 midi_cc -1  macro name 	Macro 8 value 0.0 midi_cc -1  MidiAutomation   MPEData Enabled  