program InterfaceInheritance;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main.View in 'Main.View.pas' {MainView},
  API.Interfaces in 'API\API.Interfaces.pas',
  API.Types in 'API\API.Types.pas',
  API.Model in 'API\API.Model.pas';

{$R *.res}

begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}

  Application.Initialize;
  Application.CreateForm(TMainView, MainView);
  Application.Run;
end.
