Processor 
Type SynthChain ID Tremmy Bypassed Gain 	      �?Balance 	        VoiceLimit 	      P@KillFadeTime 	      4@IconColour 0 packageName  BuildVersion �  EditorStates BodyShown 0 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors  Processor Type ScriptProcessor ID Interface Bypassed Script �Content.makeFrontInterface(320, 500);

//TYPE SWITCH
const var SimpleGain1 = Synth.getEffect("Simple Gain1");
const var Saturator1 = Synth.getEffect("Saturator1");

inline function ontypeButtonControl(component, value)
{
	SimpleGain1.setBypassed(value);
	Saturator1.setBypassed(1-value);
};

Content.getComponent("typeButton").setControlCallback(ontypeButtonControl);

//-----MOD
const var LFOModulator1 = Synth.getModulator("LFO Modulator1");
const var LFOModulator2 = Synth.getModulator("LFO Modulator2");

//SpeedMOD

inline function onspeedKnobSyncControl(component, value)
{
	LFOModulator1.setAttribute(LFOModulator1.Frequency, value);
	LFOModulator2.setAttribute(LFOModulator2.Frequency, value);
};

Content.getComponent("speedKnobSync").setControlCallback(onspeedKnobSyncControl);

//DepthMOD

inline function ondepthKnobControl(component, value)
{
	LFOModulator1.setIntensity(value);
	LFOModulator2.setIntensity(value);

};

Content.getComponent("depthKnob").setControlCallback(ondepthKnobControl);

//WaveMOD

inline function onwaveKnobControl(component, value)
{
	LFOModulator1.setAttribute(LFOModulator1.WaveFormType, value);
	LFOModulator2.setAttribute(LFOModulator2.WaveFormType, value);
};

Content.getComponent("waveKnob").setControlCallback(onwaveKnobControl);


//Web

inline function onScriptButton3Control(component, value)
{
if (value)
	    Engine.openWebsite("https://drbrujosounds.com/");
};

Content.getComponent("ScriptButton3").setControlCallback(onScriptButton3Control);

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
  EditorStates BodyShown 1 Visible 1 Solo 0 contentShown 1 onInitOpen 1  ChildProcessors   Content  Control type ScriptButton id ScriptButton2 value 	      �? Control type ScriptSlider id depthKnob value 	      �? Control type ScriptSlider id speedKnobSync value 	      "@ Control type ScriptSlider id 
waveKnob value 	      �? Control type ScriptButton id typeButton value 	         UIData  ContentProperties DeviceType 	Desktop Component type ScriptImage id ScriptImage1 x 	        y 	        width 	      t@height 	     @@fileName {PROJECT_FOLDER}tremmybg.png  Component type ScriptButton id ScriptButton2 x 	     �`@y 	     �t@width 	     �Q@height 	      R@filmstripImage '{PROJECT_FOLDER}guitatpedalswitch.png isPluginParameter 1 pluginParameterName Bypass processorId Tremmy parameterId 	Enabled  Component 
type ScriptButton id ScriptButton1 x 	     �a@y 	     �J@width 	      F@height 	      E@filmstripImage {PROJECT_FOLDER}Dual_LED.png saveInPreset processorId  linkedTo ScriptButton2  Component type ScriptSlider id depthKnob x 	      O@y 	      I@width 	     �V@height 	     �V@filmstripImage {PROJECT_FOLDER}trem.png numStrips 	      ?@isPluginParameter 1 pluginParameterName Depth defaultValue 	      �? Component type ScriptSlider id speedKnobSync x 	      P@y 	     �b@width 	     �V@height 	     �V@filmstripImage {PROJECT_FOLDER}trem.png numStrips 	      ?@isPluginParameter 1 pluginParameterName Speed defaultValue 	      "@mode TempoSync max 	      2@stepSize 	      �?middlePosition 	      "@showValuePopup Below  Component type ScriptSlider id 
waveKnob x 	      e@y 	      I@width 	     �V@height 	     �V@filmstripImage {PROJECT_FOLDER}trem.png numStrips 	      ?@max 	      @middlePosition 	      @stepSize 	      �?showValuePopup Below min 	      �?defaultValue 	      �?isPluginParameter 1 pluginParameterName Wave  Component 	type ScriptButton id typeButton x 	      h@y 	     `e@width :   height 8   filmstripImage #{PROJECT_FOLDER}switch_toggle.png isPluginParameter 1 pluginParameterName Type  Component 	type ScriptLabel id DEPTH x 	     �S@y 	     �`@width 	      M@height 	      7@itemColour2 	1118481 fontSize 	      &@editable  Component 	type ScriptLabel id WAVE x 	     �g@y 	     �`@width 	      M@height 	      7@itemColour2 	1118481 fontSize 	      &@editable  Component 	type ScriptLabel id SPEED x 	     �S@y 	     @m@width 	     �M@height 	      =@itemColour2 	1118481 fontSize 	      &@editable  Component 	type ScriptLabel id AMPLITUDE x 	     `b@y 	      d@width 	     �M@height 	      =@itemColour2 	1118481 fontSize 	       @editable  Component 	type ScriptLabel id 
HARMONIC x 	     `b@y 	     �i@width 	     �M@height 	      =@itemColour2 	1118481 fontSize 	       @editable  Component 	type ScriptButton id ScriptButton3 x 	      q@y 	     P}@width 	     �G@height 	      ?@saveInPreset 0 filmstripImage "{PROJECT_FOLDER}manualbutton.png isMomentary 1  Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 1 Solo 0 Folded 0  ChildProcessors  Processor Type SimpleGain ID Simple Gain1 Bypassed Gain 	        Delay 	        Width 	      Y@Balance 	        InvertPolarity 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor Type LFO ID LFO Modulator1 Bypassed Intensity 	      �?Frequency 	      "@FadeIn 	        WaveformType 	      �?Legato 	      �?TempoSync 	      �?SmoothingTime 	        LoopEnabled 	      �?PhaseOffset 	        CustomWaveform �108...............vOwvvv5....9C...vOFFFN9....9C...vO211N9.........vOIII09.3FKyC...vO21119....9C...vOXXXL+....9C...vOaaaQ+.........vO...f+.........vO StepData [64....f+....9C...3O...f+....9C...3O...f+....9C...3O...f+....9C...3O...f+....9C...3O...f+. EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID LFO Intensity Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID LFO Frequency Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Delay Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Width Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Pan Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type Saturator ID Saturator1 Bypassed Saturation 	      �?WetAmount 	      �?PreGain 	        PostGain 	   @���EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Saturation Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type LFO ID LFO Modulator2 Bypassed Intensity 	      �?Frequency 	      "@FadeIn 	    \��?WaveformType 	      �?Legato 	      �?TempoSync 	      �?SmoothingTime 	   @
��?LoopEnabled 	      �?PhaseOffset 	        CustomWaveform �108...............vOwvvv5....9C...vOXXXP9Dl388C...vO544Q9.........vOaaa69.........vOzyy69....9C...vORRRN+Dl388C...vOtssU+.........vO...f+.........vO StepData [64....f+....9C...3O...f+....9C...3O...f+....9C...3O...f+....9C...3O...f+....9C...3O...f+. EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID LFO Intensity Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID LFO Frequency Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� macro_controls  macro name 	Macro 1 value 0.0 midi_cc -1  macro name 	Macro 2 value 0.0 midi_cc -1  macro name 	Macro 3 value 0.0 midi_cc -1  macro name 	Macro 4 value 0.0 midi_cc -1  macro name 	Macro 5 value 0.0 midi_cc -1  macro name 	Macro 6 value 0.0 midi_cc -1  macro name 	Macro 7 value 0.0 midi_cc -1  macro name 	Macro 8 value 0.0 midi_cc -1  MidiAutomation   MPEData Enabled  