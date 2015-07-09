unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
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
  Form5: TForm5;

implementation

uses Unit2, DB, Unit1;

{$R *.dfm}
procedure TForm5.ComboBox1Change(Sender: TObject);
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
procedure TForm5.ComboBox2Change(Sender: TObject);
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
 end;
procedure TForm5.ComboBox3Change(Sender: TObject);
begin
   DataModule2.ADOQ_dw.Close;
   DataModule2.ADOQ_dw.sql.Text:='select  Num,IP, Emap_X ,Emap_Y from Unit where Name='''+ComboBox3.Text+'''';
   DataModule2.ADOQ_dw.Open;

   Edit3.Text:= DataModule2.ADOQ_dw.Fields[0].AsString;
   Edit4.Text:= DataModule2.ADOQ_dw.Fields[1].AsString;
   Edit1.Text:= DataModule2.ADOQ_dw.Fields[2].AsString;
   Edit2.Text:= DataModule2.ADOQ_dw.Fields[3].AsString;
end;
procedure TForm5.Button1Click(Sender: TObject);
begin
if ComboBox3.Text='' then
    begin
    ShowMessage('Î´Ñ¡Ôñµ¥Î»£¬É¾³ýÊ§°Ü£¡');
    close;
    end
    else
    begin
    DataModule2.ADOQ_dw.close;
    DataModule2.ADOQ_dw.SQL.Text:=' update Unit set IP=null,Emap_X=null,Emap_Y=null,Address=null,Mark=null where Name='''+ComboBox3.Text+'''';
    DataModule2.ADOQ_dw.ExecSQL;

    if CheckBox1.Checked=False then
      ShowMessage('É¾³ý³É¹¦£¡');

      form1.init;
    end
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
close;
end;

end.
