unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, SHFolder, ShellAPI;

type
  TForm1 = class(TForm)
    Image1: TImage;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Label1: TLabel;
    btn1: TButton;
    btn2: TButton;
    lbl1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure DelFilesFromDir(Directory, FileMask: string; DelSubDirs: Boolean);
    procedure RunApplication(FilePath: string);
    procedure OpenURL(url: string);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  OpenURL('https://github.com/Inforcer25/h1z1-multi-fix');
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  OpenURL('https://www.youtube.com/Inforcer25');
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  filedir: string;
begin
  filedir := GetEnvironmentVariable('USERPROFILE') + '\AppData\LocalLow\Daybreak Game Company\Digests\H1Z1-KingKill';

  DelFilesFromDir(filedir, '*.*', True);

  if (RadioGroup1.ItemIndex = 0) or (RadioGroup1.ItemIndex = 1) or (RadioGroup1.ItemIndex = 2) or (RadioGroup1.ItemIndex = 3) then
    begin
      if RadioGroup1.ItemIndex = 0 then
        RunApplication('steam://rungameid/295110');

      if RadioGroup1.ItemIndex = 1 then
        RunApplication('steam://rungameid/362300');

      if RadioGroup1.ItemIndex = 2 then
        RunApplication('steam://rungameid/433850');

      if RadioGroup1.ItemIndex = 3 then
        RunApplication('steam://rungameid/439700');
    end
  else
    ShowMessage('You need to select a game to launch');
end;

procedure TForm1.DelFilesFromDir(Directory, FileMask: string;
  DelSubDirs: Boolean);
var
  SourceLst: string;
  FOS: TSHFileOpStruct;
begin
  FillChar(FOS, SizeOf(FOS), 0);
  FOS.Wnd := Application.MainForm.Handle;
  FOS.wFunc := FO_DELETE;
  SourceLst := Directory + '\' + FileMask + #0;
  FOS.pFrom := PChar(SourceLst);
  if not DelSubDirs then
    FOS.fFlags := FOS.fFlags OR FOF_FILESONLY;
  // Remove the next line if you want a confirmation dialog box
  FOS.fFlags := FOS.fFlags OR FOF_NOCONFIRMATION;
  // Add the next line for a "silent operation" (no progress box)
  // FOS.fFlags := FOS.fFlags OR FOF_SILENT;
  SHFileOperation(FOS);
end;

procedure TForm1.OpenURL(url: string);
begin
  ShellExecute(self.WindowHandle,'open',PChar(url),nil,nil, SW_SHOWNORMAL);
end;

procedure TForm1.RunApplication(FilePath: string);
begin
  ShellExecute(self.WindowHandle,'open',PChar(FilePath),nil,nil, SW_SHOWNORMAL);
end;

end.
