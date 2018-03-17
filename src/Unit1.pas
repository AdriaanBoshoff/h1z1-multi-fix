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
    btn5: TButton;
    btn6: TButton;
    procedure FormCreate(Sender: TObject);
    procedure OpenURL(url: string);
    procedure RunApplication(FilePath: string);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure DeleteDirectory(const Name: string);
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
  DeleteDirectory(filedir);
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
      DeleteDirectory(filedir);

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

procedure TForm1.btn5Click(Sender: TObject);
begin
  OpenURL('https://github.com/AdriaanBoshoff/h1z1-multi-fix');
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
  OpenURL('https://www.youtube.com/https://www.youtube.com/channel/UCcTPklJvT-3u0e7K6HBKYvw?view_as=subscriber');
end;

procedure TForm1.DeleteDirectory(const Name: string);
var
  F: TSearchRec;
begin
  if FindFirst(Name + '\*', faAnyFile, F) = 0 then begin
    try
      repeat
        if (F.Attr and faDirectory <> 0) then begin
          if (F.Name <> '.') and (F.Name <> '..') then begin
            DeleteDirectory(Name + '\' + F.Name);
          end;
        end else begin
          DeleteFile(Name + '\' + F.Name);
        end;
      until FindNext(F) <> 0;
    finally
      FindClose(F);
    end;
    RemoveDir(Name);
  end;
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
