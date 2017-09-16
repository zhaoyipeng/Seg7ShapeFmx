program Bingo;

uses
  System.StartUpCopy,
  FMX.Forms,
  GingoMain in 'GingoMain.pas' {MainForm},
  Seg7ShapeFmx in '..\Seg7ShapeFmx.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
