unit Unit1_dl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, ExtCtrls, jpeg;

type
  TForm1_dl = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit3: TEdit;
    Button3: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1_dl: TForm1_dl;
  i: Integer = 0;
  s,w:string;

implementation

uses Unit2, Unit__daying, Unit__qycz, Unit_bbxx, Unit1, Unit3_cssz;

{$R *.dfm}

procedure TForm1_dl.Button2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1_dl.Button1Click(Sender: TObject);
begin
if (edit1.Text='') or (edit2.Text='')then
begin
    Application.MessageBox('请输入完整信息！','错误提示',MB_OK+MB_ICONERROR);
    if edit1.Text='' then
    edit1.SetFocus
    else edit2.SetFocus;
    exit;
end;
if Edit3.text='' then
  begin
     Application.MessageBox('请输入验证码！','错误提示',MB_OK+MB_ICONERROR);
     edit3.SetFocus;
     exit;
  end;

with DataModule2.ADOQ_dl do
 begin
  Close;
  SQL.Clear;
  SQL.Add('select * from UserLogin where(UserName=:a)and (UserPwd=:b)');
  Parameters.ParamByName('a').Value:=Trim(Edit1.Text);
  Parameters.ParamByName('b').Value:=Trim(Edit2.Text);
  Open;
 end;

if edit3.Text=Inttostr(strtoint(Label4.Caption)+strtoint(Label6.Caption))then
 if (DataModule2.ADOQ_dl.RecordCount>0)  then
  begin
  form1.Show;
  form1.StatusBar1.Panels[1].Text :=trim(DataModule2.ADOQ_dl.Fields[1].AsString);
  form1.StatusBar1.Panels[4].Text :=trim(DataModule2.ADOQ_dl.Fields[3].AsString);
  if trim(DataModule2.ADOQ_dl.Fields[3].AsString)<>'系统管理员' then
    begin
      form1.N1213.Enabled:=false;
      form1.N10.Enabled:=false;
    end;
  form1_dl.close;
  end
 else
 begin
 if i<2 then
 begin
 Application.MessageBox('用户名或密码不正确，请重新输入！','提示',0+64);
 Edit1.Clear;
 Edit2.Clear;
 Edit3.Clear;
 Edit1.SetFocus;
 begin
  Label4.Caption:='';
  Label6.Caption:='';
  s := IntToStr(Random(100)+1);
  w:= IntToStr(Random(100)+1);
  Label4.Caption:=Label4.Caption + s;
  Label6.Caption:=Label6.Caption + w;
end;
 inc(i);
 end
 else
 begin
 application.MessageBox('对不起，您无权使用本系统','提示',0+64);
 application.Terminate;
 end;
 end
else
begin
Application.MessageBox('验证码不正确，请重新输入！','提示',0+64);
begin
  Label4.Caption:='';
  Label6.Caption:='';
  s := IntToStr(Random(100)+1);
  w:= IntToStr(Random(100)+1);
  Label4.Caption:=Label4.Caption + s;
  Label6.Caption:=Label6.Caption + w;
  Edit3.Clear;
  Edit3.SetFocus;
end;
end;
end;

procedure TForm1_dl.FormCreate(Sender: TObject);
begin
 Randomize;
end;

procedure TForm1_dl.FormShow(Sender: TObject);
begin
  Label4.Caption:='';
  Label6.Caption:='';
  s := IntToStr(Random(100)+1);
  w:= IntToStr(Random(100)+1);
  Label4.Caption:=Label4.Caption + s;
  Label6.Caption:=Label6.Caption + w;
end;


procedure TForm1_dl.Button3Click(Sender: TObject);
begin
  Label4.Caption:='';
  Label6.Caption:='';
  s := IntToStr(Random(100)+1);
  w:= IntToStr(Random(100)+1);
  Label4.Caption:=Label4.Caption + s;
  Label6.Caption:=Label6.Caption + w;
  Edit3.Clear;
  Edit3.SetFocus;
end;

procedure TForm1_dl.Timer1Timer(Sender: TObject);
begin
  label8.Font.Color:=rgb(random(255),random(255),random(255));
  If Label8.Left + Label8.Width > 0 Then
    Label8.Left := Label8.Left - 100
  Else
    Label8.Left := Form1.Width;
end;
procedure TForm1_dl.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    perform(WM_NEXTDLGCTL,0,0)
end;

end.






