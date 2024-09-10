%% Create an App to Play and Visualize Audio Files
% This example shows how to create an app to play and visualize audio
% files. The app plots any audio file and plays it using
% |audioDeviceWriter|. While playing the audio, the app updates a playback
% cursor, a time status indicator, and a |uiaudiometer| component to
% perform sound level metering.

% Copyright 2023 The MathWorks, Inc.

%% Create App
% Create an app in *App Designer* with the following components:
% 
% * A grid layout manager to lay out the app
% * An edit field with a label and a button to select the audio file
% * An axes to plot the audio waveform
% * An audio meter to perform sound level metering during playback
% * Audio playback buttons to play/pause/stop audio and play audio in a
% loop
% * A label to display the audio playback time
% 
% Add the components listed above and create an app in App Designer.
% 
% <<../AudioPlayerWithMeter_Screenshot.png>>
% 

%% Browse and Load Audio File
% In the callback function for the *Browse* button, use |uigetfile| to
% browse for audio files. If a valid audio file is selected, update the
% edit field value with the file name and load the audio file data.
%%
%
%   function AudioFileBrowseButtonPushed(app, event)
%   if (exist(app.AudioFileName,'file'))
%       currFile = which(app.AudioFileName);
%   else
%       currFile = app.AudioFileName;
%   end
%  
%   dialogTitle = 'Select Audio File';
%   audioFilesTitle = 'Audio Files (*.wav,*.flac,*.ogg,*.aif,*.mp3, ...)';
%   allFilesTitle = 'All Files (*.*)';
%   audioFileExts = dsp.AudioFileReader.getSupportedFileExtensions();
%   audioFileFormats = join(strcat('*', audioFileExts(:)),';');
%   filterSpec = {audioFileFormats{1}, audioFilesTitle; ...
%       '*.*', allFilesTitle};
%   [filename, pathname] = uigetfile(filterSpec,dialogTitle,currFile);
% 
%   if filename
%       app.AudioFileName = fullfile(pathname,filename);
%       app.AudioFileEditField.Value = app.AudioFileName;
%       loadAudioFile(app);
%   end
%

%% Plot Audio Waveform
% When a valid audio file is selected, read the contents of the audio file
% using |audioread| and plot the audio waveform. Alternatively, you could
% follow the steps in
% <docid:audio_ug#mw_64ace299-fc71-4fae-9c93-398d31ae4324 Plot Large Audio
% Files> example to load and plot only the overall envelope of the audio
% waveform.
%%
%
%   function loadAudioFile(app)
%   % Read audio data from the file and plot its waveform
%   try
%       [y,fs] = audioread(app.AudioFileName);
%       t = seconds(0:1/fs:(size(y,1)-1)/fs);
%   catch ME
%       uialert(app.UIFigure,ME.message,'Invalid File');
%   end
% 
%   % Clear the axes and plot the audio data
%   ax = app.UIAxes;
%   cla(ax);
%   plot(ax,t,y);
%   xlim(ax,"tight");
%   ylim(ax,[-1 1]);
%

%% Play Audio File
% Configure the callback functions of the playback buttons to play/pause
% audio, stop playing audio, and toggle playing the file in a loop.
%
% In the callback function for the *Play* button, create an audio stream
% loop to read and play audio frame-by-frame and to update the UI. Use
% |dsp.AudioFileReader| to read an audio frame, |audioDeviceWriter| to play
% that audio frame, and |audioLevelMeter| to compute the sound levels and
% update the |uiaudiometer| component. Also, for every audio frame
% processed, update the playback cursor and the playback status readout.
%%
%
%   currPointer = app.AudioFileReadPointer;
%   while ~isDone(reader) &&  ~(app.StopRequested || app.PauseRequested)
%       % Read audio data, play, and update the meter
%       audioIn = reader();
%       player(audioIn);
%       uimeter.Value = levelMeter(audioIn);
%       % Increment read pointer and update cursor position
%       currPointer = currPointer + size(audioIn,1);
%       setPlaybackPosition(app,currPointer);
%       % Call drawnow to update graphics
%       drawnow limitrate
%   end
%   app.AudioFileReadPointer = currPointer;
%
