unit Main.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo;

type
  TMainView = class(TForm)
    BtnTest: TButton;
    Memo_1: TMemo;
    procedure BtnTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainView: TMainView;

implementation

uses
  API.Model, API.Interfaces, API.Types;

{$R *.fmx}

procedure TMainView.BtnTestClick(Sender: TObject);
var
  LSQLiteParams: iSQLiteParams<TSQLiteDriver>;
begin
  LSQLiteParams := TSqliteParams<TSQLiteDriver>.New('DATABASE');
  try
    LSQLiteParams
      .Pooled(True)
      .Username('Admin')
      .Password('123');
  finally
    Memo_1.Lines.Text := 'LockingMode: ' +LSQLiteParams.LockingMode.ToString+ sLineBreak+
                         'Encrypt: ' +LSQLiteParams.Encrypt.ToString+ sLineBreak+
                         'Pooled: ' +BoolToStr(LSQLiteParams.Pooled, True)+ sLineBreak+
                         'Database: ' +LSQLiteParams.Database+ sLineBreak+
                         'UserName: ' +LSQLiteParams.UserName+ sLineBreak+
                         'Password: ' +LSQLiteParams.Password;
  end;
end;

end.
