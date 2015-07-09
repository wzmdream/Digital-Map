unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzGroupBar, ExtCtrls, RzPanel, DB, ComCtrls, ToolWin,
  DBCtrls, ADODB, ImgList, inifiles,Menus, jpeg, Grids, DBGrids, Buttons;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ImageList1: TImageList;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton13: TToolButton;
    PopupMenu1: TPopupMenu;
    N4211: TMenuItem;
    N1211: TMenuItem;
    N121: TMenuItem;
    N122: TMenuItem;
    N123: TMenuItem;
    RzGroupBar1: TRzGroupBar;
    RzGroup1: TRzGroup;
    RzGroup2: TRzGroup;
    RzGroup3: TRzGroup;
    Image2: TImage;
    PopupMenu2: TPopupMenu;
    N124: TMenuItem;
    N125: TMenuItem;
    N1212: TMenuItem;
    N1213: TMenuItem;
    StatusBar1: TStatusBar;
    Image1: TImage;
    N1: TMenuItem;
    N2: TMenuItem;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    Label1: TLabel;
    PopupMenu3: TPopupMenu;
    N101: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    ToolButton1: TToolButton;
    N8: TMenuItem;
    N9: TMenuItem;
    jljs_ts: TLabel;
    PopupMenu4: TPopupMenu;
    ToolButton12: TToolButton;
    ToolButton14: TToolButton;
    Timer1: TTimer;
    ToolButton15: TToolButton;
    N10: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    Function init():Boolean;
    Function jljs():Boolean;
    Function ht():Boolean;
    Function paintcircle():Boolean;   //画圆点
    Function iniCreate():Boolean;
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure N1212Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N4211Click(Sender: TObject);
    procedure N1211Click(Sender: TObject);
    procedure N122Click(Sender: TObject);
    procedure N121Click(Sender: TObject);
    procedure N123Click(Sender: TObject);
    procedure N101Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N2Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton7Click(Sender: TObject);
    procedure N124Click(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButton4Click(Sender: TObject);
    procedure N125Click(Sender: TObject);

    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure Im(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CopyScreenToBmp(var Image:TImage);
    procedure ToolButton15Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OldX,Oldy:Integer;
    endx,endy:Integer;
    IP,User,Password,Database,Escale,SScale,Inifilename,login:String;
  end;

var
  Form1: TForm1;
  myinifile:TIniFile;
  pensize:Integer=3;
  pencolor:Tcolor=clBlack;
  paintX:Integer=-1;
  paintY:Integer=-1;
  sum:Integer=0;
  distance:Extended=0;
  flag1:Boolean=true;
  flag0:Boolean=true;
  r:Integer=5;
  i:Integer=1500;
  j:Integer=2000;

implementation


uses Unit2, Math, Unit3_cssz, Unit_bbxx, Unit__qycz, Unit__daying,
  Unit1_dl, Unit3_bz, Unit3, Unit4, Unit5;

{$R *.dfm}
  //********************画圆点******************//
Function TForm1.paintcircle():Boolean;
var
x,y,r:Integer;
begin
     r:=5;
       DataModule2.ADOQ_tj.Close;
       DataModule2.ADOQ_tj.SQL.Text:=' select Name,Emap_X,Emap_Y from Unit where Emap_X<>null and Emap_Y<>null ' ;
       DataModule2.ADOQ_tj.Open;
       DataModule2.ADOQ_tj.First;
      while not  DataModule2.ADOQ_tj.eof do
      begin
        x:= DataModule2.ADOQ_tj.fieldbyname('Emap_X').AsInteger;
        y:= DataModule2.ADOQ_tj.fieldbyname('Emap_Y').AsInteger;
        image1.Canvas.pen.Color:=clRed;
        image1.Canvas.Brush.Color:=clRed;         // Brash.Color:=clRed;
        image1.Canvas.Ellipse(x-r,y-r,x+r,y+r);
         DataModule2.ADOQ_tj.Next;
      end;
      paintcircle:=true;

end;


Function TForm1.iniCreate():Boolean;
begin
          try      //读取配置文件
      Inifilename:=ExtractFilePath(paramstr(0))+'Program.ini';
      myinifile:=TIniFile.Create(inifilename);
      IP:=Myinifile.readstring('服务器','IP','');
      User:=Myinifile.readstring('服务器','User','');
      Password:=Myinifile.readstring('服务器','Password','');
      Database:=Myinifile.readstring('服务器','Database','');
      Escale:=Myinifile.readstring('地图','Escale','');
      SScale:=Myinifile.readstring('地图','SScale','');
      myinifile.Destroy;
      except
       Application.MessageBox('参数配置失败！','错误提示',MB_OK+MB_ICONERROR);
       close;
      end;
      iniCreate:=true;
end;

Function TForm1.ht():Boolean;
begin
        if ToolButton7.Down then
        begin
          Image1.Cursor:=crCross;//   写 画图  ******
          flag1:=false;
        end
        else
        begin
          flag1:=true;
          Image1.Cursor:=crHandPoint;
          end;
          ht:=true;
end;
//**********************  距离计算  ********************
Function TForm1.jljs():Boolean;
begin
    Image1.Cursor:=crCross;
     if n1212.Checked then
    begin
        Application.MessageBox(PAnsiChar('你画出的总距离是：'+IntToStr(sum )+'米。'),'距离',MB_OK+MB_ICONQUESTION);
        sum:=0;
        Image1.Cursor:=crHandPoint; //鼠标复原
    end;
    n1212.Checked:=not n1212.Checked;
    paintX:=-1;
    paintY:=-1;
    jljs_ts.Visible:=false;
    jljs:=true;
end;
//***********************  初始化  *****************
Function TForm1.init():Boolean;

begin

     DataModule2.ADOTa_class.Open;
     while not DataModule2.ADOTa_class.Eof do
     begin
         ComboBox1.Items.Add(Trim(DataModule2.ADOTa_class.Fields[1].AsString));
         ComboBox4.Items.add( Trim(DataModule2.ADOTa_class.Fields[1].AsString));
         DataModule2.ADOTa_class.Next;
     end;
     ComboBox1.Text:=ComboBox1.Items.Strings[0];
     //ComboBox4.Text:=ComboBox1.Items.Strings[0];
    DataModule2.ADOTa_area.Open;
     while not DataModule2.ADOTa_area.Eof do
     begin
         ComboBox2.Items.Add(Trim( DataModule2.ADOTa_area.Fields[1].AsString));
         ComboBox5.Items.Add(Trim( DataModule2.ADOTa_area.Fields[1].AsString));
          DataModule2.ADOTa_area.Next;
     end;
     ComboBox2.Text:=ComboBox2.Items.Strings[0];
      ComboBox3.Items.Clear;
       DataModule2.ADOQu_QYHF.Close;
       DataModule2.ADOQu_QYHF.SQL.Text:= 'select Name from Unit where Area = '''+ ComboBox2.text +''' and Class = ''' +  ComboBox1.Text + '''' ;
       DataModule2.ADOQu_QYHF.Open;
      while not  DataModule2.ADOQu_QYHF.Eof do
      begin
          ComboBox3.Items.Add(Trim( DataModule2.ADOQu_QYHF.Fields[0].AsString));
           DataModule2.ADOQu_QYHF.Next;
      end;
  //    ComboBox3.Text:=ComboBox3.Items.Strings[0];

         Image1.Picture.LoadFromFile(ExtractFilePath(paramstr(0))+'Emap.bmp');
      DataModule2.ADOQ_tj.Close;
      DataModule2.ADOQ_tj.SQL.Text:='select count(*) from Unit ';
       DataModule2.ADOQ_tj.Open;
      Label1.Caption:= ComboBox5.Text+ComboBox4.Text+'类型共有'+Trim( DataModule2.ADOQ_tj.Fields[0].AsString)+'个';
      //**********************************************   //画圆
      paintcircle;
      init:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
      iniCreate;
      DataModule2:=TDataModule2.create(application);
      init;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
var
s,a:String;
begin
      ComboBox3.Items.Clear ;
      s:= ComboBox2.Items.Strings[ComboBox2.itemindex];
      a:= ComboBox1.text;
      DataModule2.ADOQu_QYHF.Close;
      DataModule2.ADOQu_QYHF.SQL.Text:= 'select Name from Unit where Area = '''+ s +''' and Class = ''' +  a + '''' ;
      DataModule2.ADOQu_QYHF.Open;
    // ShowMessage(ADOQu_QYHF.SQL.Text);
      while not DataModule2.ADOQu_QYHF.Eof do
      begin
          ComboBox3.Items.Add(Trim(DataModule2.ADOQu_QYHF.Fields[0].AsString));
          DataModule2.ADOQu_QYHF.Next;
      end;
      ComboBox3.Text:='';
     DataModule2. ADOQ_jbxx.Close;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var
s,a:String;
begin
      ComboBox3.Items.Clear ;
      s:= ComboBox2.text;
      a:= ComboBox1.Items.Strings[ComboBox1.itemindex];
     DataModule2. ADOQu_QYHF.Close;
     DataModule2. ADOQu_QYHF.SQL.Text:= 'select Name from Unit where Area = '''+ s +''' and Class = ''' +  a + '''' ;
       DataModule2.ADOQu_QYHF.Open;
    // ShowMessage(ADOQu_QYHF.SQL.Text);
      while not DataModule2.ADOQu_QYHF.Eof do
      begin
          ComboBox3.Items.Add(Trim(DataModule2.ADOQu_QYHF.Fields[0].AsString));
         DataModule2. ADOQu_QYHF.Next;
      end;
      ComboBox3.Text:='';
      DataModule2.ADOQ_jbxx.Close;
end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin

    DataModule2.ADOQ_jbxx.Close;
    DataModule2.ADOQ_jbxx.SQL.Text:='select * from Unit where Name='''+Combobox3.text+'''';
    DataModule2.ADOQ_jbxx.Open;
    DataModule2.DataSource_jbxx.DataSet:=DataModule2.ADOQ_jbxx;
    DBText1.DataSource:=DataModule2.DataSource_jbxx;
    DBText2.DataSource:=DataModule2.DataSource_jbxx;
    DBText3.DataSource:=DataModule2.DataSource_jbxx;
    DBText4.DataSource:=DataModule2.DataSource_jbxx;
    DBText5.DataSource:=DataModule2.DataSource_jbxx;
    DBText6.DataSource:=DataModule2.DataSource_jbxx;
    DBText7.DataSource:=DataModule2.DataSource_jbxx;
    DBText8.DataSource:=DataModule2.DataSource_jbxx;
    DBText9.DataSource:=DataModule2.DataSource_jbxx;
    DBText10.DataSource:=DataModule2.DataSource_jbxx;
    DBText11.DataSource:=DataModule2.DataSource_jbxx;
    DBText12.DataSource:=DataModule2.DataSource_jbxx;
    DBText13.DataSource:=DataModule2.DataSource_jbxx;
    DBText14.DataSource:=DataModule2.DataSource_jbxx;
    DBText15.DataSource:=DataModule2.DataSource_jbxx;
end;

procedure TForm1.ComboBox4Change(Sender: TObject);
begin
      if(ComboBox4.Text='所有')and (ComboBox5.Text<>'全市' )   then
         begin
         DataModule2. ADOQ_tj.Close;
         DataModule2. ADOQ_tj.SQL.Text:='select count(*) from Unit where Area =''' +ComboBox5.Text+'''' ;
         DataModule2. ADOQ_tj.Open;
         end  ;
      if(ComboBox4.Text<>'所有')and (ComboBox5.Text='全市' )   then
         begin
          DataModule2.ADOQ_tj.Close;
         DataModule2.ADOQ_tj.SQL.Text:='select count(*) from Unit where Class='''+ComboBox4.Text+'''' ;
          DataModule2.ADOQ_tj.Open;
         end ;
      if(ComboBox4.Text='所有')and (ComboBox5.Text='全市' )   then
         begin
         DataModule2. ADOQ_tj.Close;
          DataModule2.ADOQ_tj.SQL.Text:='select count(*) from Unit ' ;
          DataModule2.ADOQ_tj.Open;
         end ;
        if  (ComboBox4.Text<>'所有')and (ComboBox5.Text<>'全市' )   then
        begin
        DataModule2. ADOQ_tj.Close;
         DataModule2. ADOQ_tj.SQL.Text:='select count(*) from Unit where Class='''+ComboBox4.Text+''' and Area =''' +ComboBox5.Text+'''' ;
          DataModule2.ADOQ_tj.Open;
        end;
      Label1.Caption:= ComboBox5.Text+ComboBox4.Text+'类型共有'+Trim(DataModule2.ADOQ_tj.Fields[0].AsString)+'个';
end;

procedure TForm1.ComboBox5Change(Sender: TObject);
begin
    if(ComboBox4.Text='所有')and (ComboBox5.Text<>'全市' )   then
         begin
          DataModule2.ADOQ_tj.Close;
         DataModule2. ADOQ_tj.SQL.Text:='select count(*) from Unit where Area =''' +ComboBox5.Text+'''' ;
         DataModule2. ADOQ_tj.Open;
         end;
         if(ComboBox4.Text<>'所有')and (ComboBox5.Text='全市' )   then
         begin
          DataModule2.ADOQ_tj.Close;
          DataModule2.ADOQ_tj.SQL.Text:='select count(*) from Unit where Class='''+ComboBox4.Text+'''' ;
         DataModule2. ADOQ_tj.Open;
         end;
         if(ComboBox4.Text='所有')and (ComboBox5.Text='全市' )then
         begin
         DataModule2. ADOQ_tj.Close;
          DataModule2.ADOQ_tj.SQL.Text:='select count(*) from Unit ' ;
          DataModule2.ADOQ_tj.Open;
         end ;
       if  (ComboBox4.Text<>'所有')and (ComboBox5.Text<>'全市' )   then
        begin
          DataModule2.ADOQ_tj.Close;
          DataModule2.ADOQ_tj.SQL.Text:='select count(*) from Unit where Class='''+ComboBox4.Text+''' and Area =''' +ComboBox5.Text+'''' ;
         DataModule2. ADOQ_tj.Open;
        end;
      Label1.Caption:= ComboBox5.Text+ComboBox4.Text+'类型共有'+Trim(DataModule2.ADOQ_tj.Fields[0].AsString)+'个';
end;

procedure TForm1.ToolButton9Click(Sender: TObject);
begin
 if (ToolButton9.Caption='隐藏面板' )then
  Begin
  RzGroupBar1.Visible:=false;
  ToolButton9.Caption:='显示面板';
  end
  else if(ToolButton9.Caption='显示面板')then
  Begin
  RzGroupBar1.Visible:=true;
  ToolButton9.Caption:='隐藏面板';
  end;
end;

procedure TForm1.ToolButton11Click(Sender: TObject);
begin
close;
end;

procedure TForm1.ToolButton8Click(Sender: TObject);
var
x,y:Integer;
begin
 if ToolButton8.Caption ='全图提示' then
 begin
   DataModule2.ADOQ_tj.Close;
   DataModule2.ADOQ_tj.SQL.Text:=' select Name,Emap_X,Emap_Y from Unit where Emap_X<>null and Emap_Y<>null    ' ;
  DataModule2. ADOQ_tj.Open;
    ToolButton8.Caption:='取消提示';
   while not DataModule2.ADOQ_tj.eof do
     begin
      x:=DataModule2.ADOQ_tj.fieldbyname('Emap_X').AsInteger;
      y:=DataModule2.ADOQ_tj.fieldbyname('Emap_Y').AsInteger;
      image1.Canvas.Brush.Color:=clyellow;
      image1.Canvas.Font.Size:=8;
      image1.Canvas.TextOut(x,y,DataModule2.ADOQ_tj.Fieldbyname('Name').AsString);
      DataModule2.ADOQ_tj.Next;
     end;
 end
 else
 begin
     ToolButton8.Caption:='全图提示';
     Image1.Picture.LoadFromFile(ExtractFilePath(paramstr(0))+'Emap.bmp');
      DataModule2.ADOQ_tj.Close;
     DataModule2.ADOQ_tj.SQL.Text:='select count(*) from Unit ';
     DataModule2.ADOQ_tj.Open;
      Label1.Caption:= ComboBox5.Text+ComboBox4.Text+'类型共有'+Trim(DataModule2.ADOQ_tj.Fields[0].AsString)+'个';
      //**********************************************   //画圆
     DataModule2. ADOQ_tj.Close;
     DataModule2.ADOQ_tj.SQL.Text:=' select Name,Emap_X,Emap_Y from Unit where Emap_X<>null and Emap_Y<>null    ' ;
     DataModule2. ADOQ_tj.Open;

      while not DataModule2.ADOQ_tj.eof do
      begin
        x:=DataModule2.ADOQ_tj.fieldbyname('Emap_X').AsInteger;
        y:=DataModule2.ADOQ_tj.fieldbyname('Emap_Y').AsInteger;
        image1.Canvas.pen.Color:=clRed;
        image1.Canvas.Brush.Color:=clRed;         // Brash.Color:=clRed;
        image1.Canvas.Ellipse(x-r,y-r,x+r,y+r);
        DataModule2.ADOQ_tj.Next;
      end;
 end;
end;


procedure TForm1.ToolButton1Click(Sender: TObject);
var
x,y:Integer;
count:Integer;
sumx:integer;
sumy:integer;
begin
      Image1.Picture.LoadFromFile(ExtractFilePath(paramstr(0))+'Emap.bmp');
      //**********************************************   //画圆
      paintcircle;
  Image1.Left:=0;
  Image1.Top:=49;
 count:=0;
 sumx:=0;
 sumy:=0;
 DataModule2.ADOQ_tj.Close;
 DataModule2.ADOQ_tj.SQL.Text:=' select Name,Emap_X,Emap_Y from Unit where Emap_X<>null and Emap_Y<>null and Class='''+ComboBox1.Text+''' and Area='''+ComboBox2.Text+'''' ;
 DataModule2.ADOQ_tj.Open;

 while not DataModule2.ADOQ_tj.eof do
  begin
  x:=DataModule2.ADOQ_tj.fieldbyname('Emap_X').AsInteger;
  y:=DataModule2.ADOQ_tj.fieldbyname('Emap_Y').AsInteger;
  count:=count+1;
  sumx:=sumx+x;
  sumy:=sumy+y;
  image1.Canvas.Brush.Color:=clyellow;
  image1.Canvas.Font.Size:=8;
  image1.Canvas.TextOut(x,y,DataModule2.ADOQ_tj.Fieldbyname('Name').AsString);
  DataModule2.ADOQ_tj.Next;
  end;
  if count >0 then
  begin
  Image1.top:=-trunc(sumy/count-300);
  Image1.left:=-trunc(sumx/count-500);
  end
  else
     Application.MessageBox(PAnsiChar('该区没有标注'+ComboBox1.Text+'。'),'信息提示',MB_OK);
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
begin
  init;
  i:=1500;
  j:=2000;
  if n1212.Checked then
     jljs;
  ToolButton7.down:=false;
  ht;
  ToolButton8.Caption:='全图提示';
end;

procedure TForm1.ToolButton10Click(Sender: TObject);
begin
     iniCreate;
     setting.Show;
     setting.ip.text:= ip ;
     setting.user.text:=User ;
     setting.password.text:=Password;
     setting.escale.text:=Escale;
     setting.sscale.text:=SScale;
     setting.Database.Text:=Database;
     
end;

procedure TForm1.N1212Click(Sender: TObject);
begin
  jljs;
    
end;

procedure TForm1.N3Click(Sender: TObject);
begin
pencolor:=clRed;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
 pencolor:=clGreen;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
   pencolor:=clBlue;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
pencolor:=clYellow;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
pencolor:=clBlack;
end;

procedure TForm1.N4211Click(Sender: TObject);
begin
pensize:=1;
end;

procedure TForm1.N1211Click(Sender: TObject);
begin
pensize:=2;
end;

procedure TForm1.N122Click(Sender: TObject);
begin
pensize:=3;
end;

procedure TForm1.N121Click(Sender: TObject);
begin
pensize:=5;
end;

procedure TForm1.N123Click(Sender: TObject);
begin
pensize:=8;
end;

procedure TForm1.N101Click(Sender: TObject);
begin
pensize:=10;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    image1.Canvas.moveto(X,Y);
    flag0:=false;
      OldX := X;
      OldY := Y;
    if (n1212.Checked=true)and (button=mbleft)  then
    begin
       with Image1.Canvas do
        begin
         Pen.Color:=clPurple;//画笔颜色
         Pen.Width:=2;  //画笔粗细
         Pen.Mode:=pmcopy;//画笔模式
         Ellipse(X-pensize,y-pensize,X+pensize,y+pensize);
        end;
      if  (paintX<>-1)and(paintY<>-1) then
       begin
          with Image1.Canvas do
          begin
           Pen.Color:=pencolor;  //画笔颜色
           Pen.Width:=pensize;  //画笔粗细
           Pen.Mode:=pmcopy;   //画笔模式
           moveto(paintX,painty); //移动至起点
           lineto(x,y); //画线至终点

           distance:=StrToFloat(Escale)*sqrt((x-paintx)*(x-paintx)+(y-painty)*(y-painty));
           with image1.Canvas do
           begin
             Brush.Color:=clblack;
             font.Color:=Clyellow;
             Font.Size:=8;
             TextOut(trunc((x+paintx)/2),trunc((y+painty)/2),FloatToStr(trunc(distance))+'米');
             sum:=sum+ trunc(distance);
             font.Color:=clBlack;
           end;
           end;
        end;
           paintX:=X;
           paintY:=Y;

     end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
bbxx.Show;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    if (toolbutton7.down=true)and (flag0=false)  then
    with Image1.Canvas do
    begin
     pen.Color:=pencolor;//画笔颜色
     Pen.Width:=pensize;  //画笔粗细
     Pen.Mode:=pmcopy;//画笔模式
     LineTo(X,Y);
     moveto(X,Y);
   end;
     if (flag0=false)and (flag1=true) then
      begin
        Image1.Left := Image1.Left + X - OldX;
        Image1.Top := Image1.Top + Y - OldY;
      end;
     StatusBar1.Panels[10].Text :=inttostr(x);
     StatusBar1.Panels[12].Text :=inttostr(y);
     if n1212.Checked then
     begin
       if  (paintX=-1)and(paintY=-1) then
       begin
           jljs_ts.Caption:='单击左键开'+#13#10+'始测距。';
       end
       else
       begin
           distance:=StrToFloat(Escale)*sqrt((x-paintx)*(x-paintx)+(y-painty)*(y-painty));
           jljs_ts.Caption:='总距离有：'+#13#10+inttostr(sum+trunc(distance))+'米' ;
       end;
       if (x<85) or (y<50) then
       begin
            if (y<50) and (x>85) then
             begin
              jljs_ts.Left:=x-95+Image1.Left;
              jljs_ts.Top:=y+60+Image1.Top-49;
             end
             else if (x<85)and (y>50)then
             begin
                jljs_ts.Left:=x+5+Image1.Left;
                jljs_ts.Top:=y+Image1.Top-49;
             end
             else
             begin
              jljs_ts.Left:=x+5+Image1.Left;
              jljs_ts.Top:=y+60+Image1.Top-49;
             end;
       end
       else
       begin
       jljs_ts.Left:=x-95+Image1.Left;
       jljs_ts.Top:=y+Image1.Top-49;
       jljs_ts.Visible:=true;
       end;
     end;
end;

procedure TForm1.ToolButton7Click(Sender: TObject);
begin
  
   ht;
end;

procedure TForm1.N124Click(Sender: TObject);
begin
       Form__qycz.Show;
      Form__qycz.ListBox1.Clear;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    flag0:=true;
end;

procedure TForm1.ToolButton4Click(Sender: TObject);
begin
   Image1.Top:=49;
   Image1.Left:=0;
end;

procedure TForm1.N125Click(Sender: TObject);
begin
   Image1.Top:=49;
   Image1.Left:=0;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  CopyScreenToBmp(JieTu_1.Image1);
  if JieTu_1.ShowModal=mrOk then     
   JieTu_0.Show ;
end;

procedure TForm1.CopyScreenToBmp(var Image:TImage);
var
 Bmp:Tbitmap;
 Canvas:TCanvas;
 DC:HDC;
begin
  Bmp := TBitmap.Create;
  Bmp.Width := screen.width;
  Bmp.Height := screen.Height;
  DC := GetDC (0);
  Canvas := TCanvas.Create;
  Canvas.Handle := DC;
  Bmp.Canvas.CopyRect(Rect (0, 0, screen.Width, screen.Height),
                      Canvas,
                      Rect (0, 0, Screen.Width, Screen.Height));
  Canvas.Free;
  ReleaseDC (0, DC);

  Image.picture.Bitmap:=Bmp;
  Image.Width:=Bmp.Width;
  Image.Height:=Bmp.Height;
  Bmp.free;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  // ShowMessage('show');
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
   //  ShowMessage('active');
  // Form1_dl.Show;
  // Form1.Visible:=false;
 // Form1_dl.ShowModal;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin

    Image1.Top:=49;
    Image1.Left:=0;
    if(ComboBox3.Text='') then
    begin
     ShowMessage('请选择'+ComboBox1.Text+'名称！');
     exit;
     end;
    init;
    DataModule2.ADOQ_dw.close;
    DataModule2.ADOQ_dw.SQL.Text:='select Emap_X ,Emap_Y from Unit where Name='''+ComboBox3.Text+'''';
    DataModule2.ADOQ_dw.Open;
    if(DataModule2.ADOQ_dw.Fields[0].AsString<>'')then
    begin
    Image1.top:= Image1.top-DataModule2.ADOQ_dw.Fields[1].AsInteger+300;
    Image1.left:= Image1.left-DataModule2.ADOQ_dw.Fields[0].AsInteger+500;
    image1.Canvas.Brush.Color:=clyellow;
    image1.Canvas.Font.Size:=8;
    image1.Canvas.TextOut(DataModule2.ADOQ_dw.Fields[0].AsInteger, DataModule2.ADOQ_dw.Fields[1].AsInteger,ComboBox3.Text);
    end
    else
      ShowMessage('此地图还未标注'+ComboBox3.Text);
end;

procedure TForm1.Im(Sender: TObject);
begin
     if StatusBar1.Panels[4].Text='系统管理员' then
     begin
     Form_bz.Show;
     init;
     Form_bz.ComboBox1.Items.Clear;
     DataModule2.ADOTa_class.Open;
      DataModule2.ADOTa_class.First;
     while not DataModule2.ADOTa_class.Eof do
     begin
     // Form_bz.ComboBox1.Items.Add(Trim(DataModule2.ADOTa_class.Fields[1].AsString));
      Form_bz.ComboBox1.Items.add(Trim(DataModule2.ADOTa_class.Fields[1].AsString));
       DataModule2.ADOTa_class.Next;
     end;
     Form_bz.ComboBox1.Text:=ComboBox1.Items.Strings[0];

     Form_bz.ComboBox2.Items.Clear;
     DataModule2.ADOTa_area.Open;
     DataModule2.ADOTa_area.First;
     while not DataModule2.ADOTa_area.Eof do
     begin
         Form_bz.ComboBox2.Items.Add(Trim( DataModule2.ADOTa_area.Fields[1].AsString));
          DataModule2.ADOTa_area.Next;
     end;
       Form_bz.ComboBox2.Text:=ComboBox2.Items.Strings[0];

       Form_bz.ComboBox3.Items.Clear;
       DataModule2.ADOQu_QYHF.Close;
       DataModule2.ADOQu_QYHF.SQL.Text:= 'select Name from Unit where Area = '''+ Form_bz.ComboBox2.text +''' and Class = ''' +  Form_bz.ComboBox1.Text + '''' ;
       DataModule2.ADOQu_QYHF.Open;
      while not  DataModule2.ADOQu_QYHF.Eof do
      begin
          Form_bz.ComboBox3.Items.Add(Trim( DataModule2.ADOQu_QYHF.Fields[0].AsString));
           DataModule2.ADOQu_QYHF.Next;
      end;
      Form_bz.Edit1.Text:=IntToStr(OldX);
      Form_bz.Edit2.Text:=IntToStr(Oldy);
      end;
end;


procedure TForm1.ToolButton12Click(Sender: TObject);
var
tmpbmp:TBitmap;
begin
 i:=i+200;
 j:=j+300;
if i>3500 then
begin
  ShowMessage('该地图已放至最大！');
  exit;
end;
Image1.Picture.LoadFromFile(ExtractFilePath(paramstr(0))+'Emap.bmp');
tmpbmp :=TBitmap.Create;
tmpbmp.Width :=i;//bmp.Width div 2;
tmpbmp.Height :=j;//bmp.Height div 2;
tmpbmp.pixelformat:=pf32bit;
tmpbmp.Canvas.StretchDraw(tmpbmp.Canvas.ClipRect,Image1.Picture.Graphic );
Image1.Picture.Assign(tmpbmp);
Image1.Update ;

end;

procedure TForm1.ToolButton14Click(Sender: TObject);
var
tmpbmp:TBitmap;
begin
i:=i-200;
j:=j-300;
if (i<0) or (j<0) then
begin
ShowMessage('该地图以缩至最小！');
exit;
end;
Image1.Picture.LoadFromFile(ExtractFilePath(paramstr(0))+'Emap.bmp');
tmpbmp :=TBitmap.Create;
tmpbmp.Width:=i;//bmp.Width div 2;
tmpbmp.Height:=j;//bmp.Height div 2;
tmpbmp.pixelformat:=pf32bit;
tmpbmp.Canvas.StretchDraw(tmpbmp.Canvas.ClipRect,Image1.Picture.Graphic );
Image1.Picture.Assign(tmpbmp);
Image1.Update
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
StatusBar1.Panels[7].Text:=DateTimeToStr( now() );
end;

procedure TForm1.ToolButton15Click(Sender: TObject);
begin
  CopyScreenToBmp(JieTu_1.Image1);
  if JieTu_1.ShowModal=mrOk then     
   JieTu_0.Show ;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
  if StatusBar1.Panels[4].Text='系统管理员' then
     begin
     Form5.Show;
     init;
     Form5.ComboBox1.Items.Clear;
     DataModule2.ADOTa_class.Open;
      DataModule2.ADOTa_class.First;
     while not DataModule2.ADOTa_class.Eof do
     begin
      Form5.ComboBox1.Items.add(Trim(DataModule2.ADOTa_class.Fields[1].AsString));
       DataModule2.ADOTa_class.Next;
     end;
     Form5.ComboBox1.Text:=ComboBox1.Items.Strings[0];

     Form5.ComboBox2.Items.Clear;
     DataModule2.ADOTa_area.Open;
     DataModule2.ADOTa_area.First;
     while not DataModule2.ADOTa_area.Eof do
     begin
         Form5.ComboBox2.Items.Add(Trim( DataModule2.ADOTa_area.Fields[1].AsString));
          DataModule2.ADOTa_area.Next;
     end;
       Form5.ComboBox2.Text:=ComboBox2.Items.Strings[0];

       Form5.ComboBox3.Items.Clear;
       DataModule2.ADOQu_QYHF.Close;
       DataModule2.ADOQu_QYHF.SQL.Text:= 'select Name from Unit where Area = '''+ Form5.ComboBox2.text +''' and Class = ''' +  Form5.ComboBox1.Text + '''' ;
       DataModule2.ADOQu_QYHF.Open;
      while not  DataModule2.ADOQu_QYHF.Eof do
      begin
          Form5.ComboBox3.Items.Add(Trim( DataModule2.ADOQu_QYHF.Fields[0].AsString));
           DataModule2.ADOQu_QYHF.Next;
      end;

     end
end;

end.
