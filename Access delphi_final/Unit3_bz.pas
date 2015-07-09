unit Unit3_bz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask;

type
  TForm_bz = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_bz: TForm_bz;

implementation

uses Unit__daying, Unit__qycz, Unit_bbxx, Unit1, Unit1_dl, Unit2,
  Unit3_cssz, DB;

{$R *.dfm}

procedure TForm_bz.ComboBox1Change(Sender: TObject);
var
s,a:String;
begin
      ComboBox3.Items.Clear ;
      s:= ComboBox2.text;
      a:= ComboBox1.Items.Strings[ComboBox1.itemindex];
     DataModule2. ADOQu_QYHF.Close;
     DataModule2. ADOQu_QYHF.SQL.Text:= 'select Name from Unit where Area = '''+ s +''' and Class = ''' +  a + '''' ;
       DataModule2.ADOQu_QYHF.Open;
      while not DataModule2.ADOQu_QYHF.Eof do
      begin
          ComboBox3.Items.Add(Trim(DataModule2.ADOQu_QYHF.Fields[0].AsString));
         DataModule2. ADOQu_QYHF.Next;
      end;
      ComboBox3.Text:='';
      DataModule2.ADOQ_jbxx.Close;
end;
procedure TForm_bz.ComboBox2Change(Sender: TObject);
var
s,a:String;
begin
      ComboBox3.Items.Clear ;
      s:= ComboBox2.Items.Strings[ComboBox2.itemindex];
      a:= ComboBox1.text;
      DataModule2.ADOQu_QYHF.Close;
      DataModule2.ADOQu_QYHF.SQL.Text:= 'select Name from Unit where Area = '''+ s +''' and Class = ''' +  a + '''' ;
      DataModule2.ADOQu_QYHF.Open;
      while not DataModule2.ADOQu_QYHF.Eof do
      begin
          ComboBox3.Items.Add(Trim(DataModule2.ADOQu_QYHF.Fields[0].AsString));
          DataModule2.ADOQu_QYHF.Next;
      end;
      ComboBox3.Text:='';
     DataModule2. ADOQ_jbxx.Close;
 end;
procedure TForm_bz.ComboBox3Change(Sender: TObject);
begin
   DataModule2.ADOQ_dw.Close;
   DataModule2.ADOQ_dw.sql.Text:='select Num,IP from Unit where Name='''+ComboBox3.Text+'''';
   DataModule2.ADOQ_dw.Open;
   Edit3.Text:= DataModule2.ADOQ_dw.Fields[0].AsString;
   Edit4.Text:= DataModule2.ADOQ_dw.Fields[1].AsString;
end;

procedure TForm_bz.Button1Click(Sender: TObject);
begin
    form1.init;
    if ComboBox3.Text='' then
    begin
    ShowMessage('未选择单位，标注失败！');
    close;
    end
    else
    begin
    DataModule2.ADOQ_dw.close;
    DataModule2.ADOQ_dw.SQL.Text:=' update Unit set IP='''+ Edit4.Text+''',Emap_X='''+Edit1.Text+''',Emap_Y='''+Edit2.Text+''',Address='''+Memo1.Text+''',Mark='''+Memo2.Text+''' where Name='''+ComboBox3.Text+'''';
    DataModule2.ADOQ_dw.ExecSQL;
    Form1.image1.Canvas.pen.Color:=clRed;
     Form1.image1.Canvas.Brush.Color:=clRed;         // Brash.Color:=clRed;
     Form1.image1.Canvas.Ellipse(Form1.OldX-5,Form1.OldY-5,Form1.OldX+5,Form1.OldY+5);
    //****************提示******************//
     Form1.image1.Canvas.Brush.Color:=clyellow;
     Form1.image1.Canvas.Font.Size:=8;
     Form1.image1.Canvas.TextOut(Form1.OldX,Form1.OldY,ComboBox3.Text);
     if CheckBox1.Checked=False then
      ShowMessage('标注成功！');
     end;
end;

procedure TForm_bz.Button2Click(Sender: TObject);
begin
close;
end;

end.
