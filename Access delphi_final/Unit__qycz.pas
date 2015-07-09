unit Unit__qycz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,printers,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids, ValEdit, ExcelXP,ComObj;

type
  TForm__qycz = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    UpDown1: TUpDown;
    Edit1: TEdit;
    Label5: TLabel;
    ColorBox1: TColorBox;
    Label6: TLabel;
    UpDown2: TUpDown;
    Edit2: TEdit;
    ListBox1: TListBox;
    ValueListEditor1: TValueListEditor;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PrintDialog1: TPrintDialog;
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   R:integer;//�뾶
  end;

var
  Form__qycz: TForm__qycz;
  sum,x,y:integer;//Բ������
  yuanshu:String ;
implementation

uses Unit2, Unit_bbxx, Unit1, Unit3_cssz, Math, Unit__daying;

{$R *.dfm}

procedure TForm__qycz.FormCreate(Sender: TObject);
begin
       DataModule2.ADOTa_class.Open;
     while not DataModule2.ADOTa_class.Eof do
     begin

         ComboBox1.Items.Add(Trim(DataModule2.ADOTa_class.Fields[1].AsString));
         DataModule2.ADOTa_class.Next;
     end;
      ComboBox1.Text:=ComboBox1.Items.Strings[0];
      ValueListEditor1.Strings.Clear; 
end;

procedure TForm__qycz.Button5Click(Sender: TObject);
begin
  close;
end;

procedure TForm__qycz.Button1Click(Sender: TObject);


begin
   if ComboBox1.Text='' then ComboBox1.Text:='����';
   if Edit1.Text ='' then Edit1.Text :='500';
   if Edit2.Text='' then Edit2.Text:='2';
   ValueListEditor1.Strings.Clear;
   sum:=0;
   x:=form1.OldX;
   y:=form1.Oldy;
   R:=trunc(StrToInt(Edit1.Text )/(StrToFloat(Form1.Escale)));//ShowMessage(inttostr(x));
   ListBox1.Clear;
   DataModule2.ADOQ_qycz.Close;
   DataModule2.ADOQ_qycz.SQL.Text:= 'select Name , Emap_X,Emap_Y from Unit where Class='''+ComboBox1.Text+'''  and (Emap_X-'+inttostr(X)+')*(Emap_X-'+inttostr(X)+')+(Emap_Y-'+inttostr(Y)+')*(Emap_Y-'+inttostr(Y)+')<='+inttostr(R*R);
   DataModule2.ADOQ_qycz.Open;
   form1.Image1.Picture.LoadFromFile(ExtractFilePath(paramstr(0))+'Emap.bmp');
   form1.paintcircle;
   form1.image1.Canvas.pen.Color:=ColorBox1.Selected;
   form1.image1.Canvas.pen.Width:=StrToInt(Edit2.Text);
   form1.image1.Canvas.Brush.Style:=bsClear;
   form1.image1.Canvas.Ellipse(x-R,y-R,x+R,y+R);
   form1.image1.Canvas.Brush.Color:=clYellow;
    while not DataModule2.ADOQ_qycz.Eof do
    begin
    ListBox1.Items.Add(DataModule2.ADOQ_qycz.Fields[0].AsString) ;
    sum:=sum+1;
    form1.image1.Canvas.TextOut(StrToInt(DataModule2.ADOQ_qycz.Fields[1].AsString),StrToInt(DataModule2.ADOQ_qycz.Fields[2].AsString),DataModule2.ADOQ_qycz.Fieldbyname('Name').AsString);
    DataModule2.ADOQ_qycz.Next;
   end;
   Label1.Caption:= '�÷�Χ�ܹ��У�'+IntToStr(sum)+'��'+ComboBox1.Text+'!';

end;

procedure TForm__qycz.ListBox1Click(Sender: TObject);
begin


  DataModule2.ADOQ_qycz.close;
  DataModule2.ADOQ_qycz.SQL.Text:='select * from Unit where Name='''+ListBox1.Items.Strings[ListBox1.itemindex]+'''';
  DataModule2.ADOQ_qycz.Open;
  ValueListEditor1.Strings.Clear;
  ValueListEditor1.InsertRow('ID',DataModule2.ADOQ_qycz.Fields[0].AsString,true);
  ValueListEditor1.InsertRow('���',DataModule2.ADOQ_qycz.Fields[1].AsString,true);
  ValueListEditor1.InsertRow('��λ����',DataModule2.ADOQ_qycz.Fields[2].AsString,true);
  ValueListEditor1.InsertRow('��������',DataModule2.ADOQ_qycz.Fields[3].AsString,true);
  ValueListEditor1.InsertRow('��ϸ��ַ',DataModule2.ADOQ_qycz.Fields[4].AsString,true);
  ValueListEditor1.InsertRow('IP��ַ',DataModule2.ADOQ_qycz.Fields[5].AsString,true);
  ValueListEditor1.InsertRow('���',DataModule2.ADOQ_qycz.Fields[6].AsString,true);
  ValueListEditor1.InsertRow('X����',DataModule2.ADOQ_qycz.Fields[21].AsString,true);
  ValueListEditor1.InsertRow('Y����',DataModule2.ADOQ_qycz.Fields[22].AsString,true);
   ValueListEditor1.InsertRow('��ע',DataModule2.ADOQ_qycz.Fields[10].AsString,true);
end;

procedure TForm__qycz.Button4Click(Sender: TObject);
var  h,k:integer;     
	Excelid: OleVariant;     
	s: string;
begin
 try
	Excelid := CreateOLEObject('Excel.Application');    
  except
	Application.MessageBox('Excelû�а�װ��', '��ʾ��Ϣ', MB_OK+MB_ICONASTERISK+MB_DEFBUTTON1+MB_APPLMODAL);        
	Exit;    
  end;
 try
   DataModule2.ADOQ_qycz.Close;
   DataModule2.ADOQ_qycz.SQL.Text:= 'select * from Unit where Class='''+ComboBox1.Text+'''  and (Emap_X-'+inttostr(X)+')*(Emap_X-'+inttostr(X)+')+(Emap_Y-'+inttostr(Y)+')*(Emap_Y-'+inttostr(Y)+')<='+inttostr(R*R);
   DataModule2.ADOQ_qycz.Open;
	k:=DataModule2.ADOQ_qycz.RecordCount;
	Excelid.Visible := True;         
	Excelid.WorkBooks.Add;
	Excelid.worksheets[1].range['A1:j1'].Merge(True);
	Excelid.WorkSheets[1].Cells[1,1].Value :='��Χ���ҽ��' ;
	Excelid.worksheets[1].Range['a1:a1'].HorizontalAlignment := $FFFFEFF4;
	Excelid.worksheets[1].Range['a1:a1'].VerticalAlignment := $FFFFEFF4;
	Excelid.WorkSheets[1].Cells[2,1].Value := 'ID';
	Excelid.WorkSheets[1].Cells[2,2].Value := '���';
  Excelid.WorkSheets[1].Cells[2,3].Value := '��λ����';
  Excelid.WorkSheets[1].Cells[2,4].Value := '��������';
  Excelid.WorkSheets[1].Cells[2,5].Value := '��ϸ��ַ';
  Excelid.WorkSheets[1].Cells[2,6].Value := 'IP��ַ';
  Excelid.WorkSheets[1].Cells[2,7].Value := '���';
  Excelid.WorkSheets[1].Cells[2,8].Value := 'X����';
	Excelid.WorkSheets[1].Cells[2,9].Value := 'Y����';
  	Excelid.WorkSheets[1].Cells[2,10].Value := '��ע';
	Excelid.worksheets[1].Range['A1:i1'].Font.Name := '����';
	Excelid.worksheets[1].Range['A1:i1'].Font.Size := 9;
	Excelid.worksheets[1].range['A1:j2'].font.bold:=true;
	Excelid.worksheets[1].Range['A2:j2'].Font.Size := 9;
	Excelid.worksheets[1].Range['A2:j2'].HorizontalAlignment := $FFFFEFF4;
	Excelid.worksheets[1].Range['A2:j2'].VerticalAlignment := $FFFFEFF4;
	h:=3;
	DataModule2.ADOQ_qycz.First;
	while not DataModule2.ADOQ_qycz.Eof do
		begin
    Excelid.WorkSheets[1].Cells[h,1].Value := DataModule2.ADOQ_qycz.Fields[0].AsString;
		Excelid.WorkSheets[1].Cells[h,2].Value := DataModule2.ADOQ_qycz.Fields[1].AsString;
		Excelid.WorkSheets[1].Cells[h,3].Value := DataModule2.ADOQ_qycz.Fields[2].AsString;
    Excelid.WorkSheets[1].Cells[h,4].Value := DataModule2.ADOQ_qycz.Fields[3].AsString;
    Excelid.WorkSheets[1].Cells[h,5].Value := DataModule2.ADOQ_qycz.Fields[4].AsString;
    Excelid.WorkSheets[1].Cells[h,6].Value := DataModule2.ADOQ_qycz.Fields[5].AsString;
    Excelid.WorkSheets[1].Cells[h,7].Value := DataModule2.ADOQ_qycz.Fields[6].AsString;
    Excelid.WorkSheets[1].Cells[h,8].Value := DataModule2.ADOQ_qycz.Fields[21].AsString;
    Excelid.WorkSheets[1].Cells[h,9].Value := DataModule2.ADOQ_qycz.Fields[22].AsString;
    Excelid.WorkSheets[1].Cells[h,10].Value := DataModule2.ADOQ_qycz.Fields[10].AsString;
		Inc(h);
		DataModule2.ADOQ_qycz.Next;
		end;         
	s := 'A2:j'+ IntToStr(k+2);
	Excelid.worksheets[1].Range[s].Font.Name := '����';
	Excelid.worksheets[1].Range[s].Font.size := 9;
	Excelid.worksheets[1].Range[s].Borders.LineStyle := 1;
	Excelid.Quit;          
except        
	Application.MessageBox('�������ݳ��������ļ��ĸ�ʽ�Ƿ���ȷ��', '��ʾ��Ϣ', MB_OK+MB_ICONASTERISK+MB_DEFBUTTON1+MB_APPLMODAL);    
end;   
MessageBox(GetActiveWindow(), 'EXCEL���ݵ����ɹ�!', '��ʾ��Ϣ', MB_OK +MB_ICONWARNING);
end;
 


procedure TForm__qycz.Button3Click(Sender: TObject);
var
prntext:system.text;
begin
  PrinterSetupDialog1.Execute;
  PrintDialog1.Execute;
  if printdialog1.execute then
  begin
    assignprn(prntext);
    DataModule2.ADOQ_qycz.Close;
    DataModule2.ADOQ_qycz.SQL.Text:= 'select * from Unit where Class='''+ComboBox1.Text+'''  and (Emap_X-'+inttostr(X)+')*(Emap_X-'+inttostr(X)+')+(Emap_Y-'+inttostr(Y)+')*(Emap_Y-'+inttostr(Y)+')<='+inttostr(R*R);
    DataModule2.ADOQ_qycz.Open;
    rewrite(prntext);
    DataModule2.ADOQ_qycz.First;
	  while not DataModule2.ADOQ_qycz.Eof do
		begin
      writeln(prntext,'ID:'+DataModule2.ADOQ_qycz.FieldByName('ID').AsString);
      writeln(prntext,'���:'+DataModule2.ADOQ_qycz.FieldByName('Num').AsString);
      writeln(prntext,'��λ����:'+DataModule2.ADOQ_qycz.FieldByName('Name').AsString);
      writeln(prntext,'��������:'+DataModule2.ADOQ_qycz.FieldByName('Area').AsString);
      writeln(prntext,'��ϸ��ַ:'+DataModule2.ADOQ_qycz.FieldByName('Address').AsString);
      writeln(prntext,'IP��ַ:'+DataModule2.ADOQ_qycz.FieldByName('IP').AsString);
      writeln(prntext,'���:'+DataModule2.ADOQ_qycz.FieldByName('Class').AsString);
      writeln(prntext,'���:'+DataModule2.ADOQ_qycz.FieldByName('Class').AsString);
      writeln(prntext,'X����:'+DataModule2.ADOQ_qycz.FieldByName('Emap_X').AsString);
      writeln(prntext,'Y����'+DataModule2.ADOQ_qycz.FieldByName('Emap_y').AsString);
      writeln(prntext,'Y����'+DataModule2.ADOQ_qycz.FieldByName('Emap_y').AsString);
      writeln(prntext,'��ע:'+DataModule2.ADOQ_qycz.FieldByName('Mark').AsString);
      DataModule2.ADOQ_qycz.next;
    end;
//��MEMO������д����ӡ������
    system.close(prntext); //�رմ�ӡ�ļ�
  end;
end;

procedure TForm__qycz.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if (key in ['0'..'9',#8])=false then
      key:=#0;
end;

procedure TForm__qycz.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
     if (key in ['0'..'9',#8])=false then
      key:=#0;
     yuanshu:=edit2.Text ;
end;

procedure TForm__qycz.Edit2Change(Sender: TObject);
begin
   if   (edit2.Text<>'') then
   if  (strtoint(edit2.Text)>10) then
      edit2.Text:=yuanshu;
end;

end.
