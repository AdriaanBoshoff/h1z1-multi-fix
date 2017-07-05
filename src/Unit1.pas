unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, SHFolder, ShellAPI;

type
  TForm1 = class(TForm)
    img1: TImage;
    lbl1: TLabel;
    rg1: TRadioGroup;
    lbl2: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    procedure btn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DelFilesFromDir(Directory, FileMask: string; DelSubDirs: Boolean);
    procedure OpenURL(url: string);
    procedure RunApplication(FilePath: string);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    filedir: string;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  DelFilesFromDir(filedir, '*.*', True);
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  if rg1.ItemIndex = -1 then
    ShowMessage('Select a Game to start')
  else
    begin
      if rg1.ItemIndex = 0 then
        RunApplication('steam://rungameid/295110');

      if rg1.ItemIndex = 1 then
        RunApplication('steam://rungameid/362300');

      if rg1.ItemIndex = 2 then
        RunApplication('steam://rungameid/433850');

      if rg1.ItemIndex = 3 then
        RunApplication('steam://rungameid/439700');
    end;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  if rg1.ItemIndex = -1 then
    ShowMessage('Select a Game to start')
  else
    begin
      DelFilesFromDir(filedir, '*.*', True);

      if rg1.ItemIndex = 0 then
        RunApplication('steam://rungameid/295110');

      if rg1.ItemIndex = 1 then
        RunApplication('steam://rungameid/362300');

      if rg1.ItemIndex = 2 then
        RunApplication('steam://rungameid/433850');

      if rg1.ItemIndex = 3 then
        RunApplication('steam://rungameid/439700');
    end;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
  OpenURL('https://github.com/Inforcer25/h1z1-multi-fix');
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
  OpenURL('https://www.youtube.com/Inforcer25');
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
  FOS.fFlags := FOS.fFlags OR FOF_NOCONFIRMATION;
  SHFileOperation(FOS);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.Title := 'H1Z1 MultiFix';
  filedir := GetEnvironmentVariable('USERPROFILE') + '\AppData\LocalLow\Daybreak Game Company\Digests\H1Z1-KingKill';
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
