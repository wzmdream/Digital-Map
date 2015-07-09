unit Unit3_cssz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,inifiles, StdCtrls, Mask;

type
  Tsetting = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ip: TEdit;
    user: TEdit;
    escale: TEdit;
    sscale: TEdit;
    password: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Database: TEdit;
    function ipShuRu():Boolean;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure escaleKeyPress(Sender: TObject; var Key: Char);
    procedure sscaleKeyPress(Sender: TObject; var Key: Char);
    procedure ipKeyPress(Sender: TObject; var Key: Char);
    procedure ipChange(Sender: TObject);
    procedure escaleChange(Sender: TObject);
    procedure sscaleChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  setting: Tsetting;
  Inifilename,iptext,iptextYuan,EScaleYuan,SScaleYuan:String;
  myinifile:TIniFile;
  pointCount:Integer=1;
  EScaleCount:Integer=0;
  SScaleCount:Integer=0;
  ip11,ip22,ip33,ip44:String;
  i:integer;
implementation

uses Unit1;

{$R *.dfm}
function Tsetting.ipShuRu():Boolean;
begin
         ip11:='';  ip22:='';  ip33:='';   ip44:='';
         pointCount:=1;
         for i:=1 to length(iptext) do
         begin

            if pointCount=1 then  //*****************************
            begin
               if iptext[i]<>'.' then
                    ip11:=ip11+iptext[i]
               else
                 pointCount:=pointCount+1;
            end
            else if pointCount=2 then  //**********************
            begin
                if iptext[i]<>'.' then
                  ip22:=ip22+iptext[i]
                else
                 pointCount:=pointCount+1;
            end
            else if pointCount=3 then   //**********************
            begin
                 if iptext[i]<>'.' then
               ip33:=ip33+iptext[i]
               else
                 pointCount:=pointCount+1;
            end
            else if pointCount=4 then  //**********************
            begin
                 if iptext[i]<>'.' then
               ip44:=ip44+iptext[i]
               else
                 pointCount:=pointCount+1;
           end;              //*************************  end  **********
       end;
       ipShuRu:=true;
end;

procedure Tsetting.Button1Click(Sender: TObject);
begin
       if (ip11='')or(ip22='')or(ip33='')or(ip44='') then
         begin
         ShowMessage('请输入正确IP');
         ip.SetFocus;
         exit;
         end;
       if (user.Text='')or(password.Text='')or(escale.Text='')or(sscale.Text='')then
       begin
          Application.MessageBox('请填写完整信息！','错误提示',MB_OK+MB_ICONERROR) ;
          exit;
       end;
       Inifilename:=ExtractFilePath(paramstr(0))+'Program.ini';
       myinifile:=TIniFile.Create(inifilename);
       myinifile.writestring('服务器','IP',trim( inttostr(strtoint(ip11))+'.'
                              +inttostr(strtoint(ip22))+'.'+inttostr(strtoint(ip33))
                              +'.'+inttostr(strtoint(ip44))) );
       myinifile.writestring('服务器','User',trim(user.Text));
       myinifile.writestring('服务器','Password',trim(password.Text));
       myinifile.writestring('服务器','Database',trim(Database.Text));
       myinifile.writestring('地图','Escale',trim(floattostr(StrToFloat(Escale.Text))));
       myinifile.writestring('地图','SScale',trim(floattostr(StrToFloat(sscale.Text))));
       Application.MessageBox('参数修改成功','提示信息',MB_OK);
       myinifile.Destroy;
       
       close;
end;

procedure Tsetting.Button2Click(Sender: TObject);
begin

close;
end;

procedure Tsetting.escaleKeyPress(Sender: TObject; var Key: Char);
begin
        if (key in ['0'..'9','.',#8])=false then
      key:=#0;
      EScaleYuan:=escale.Text;
end;

procedure Tsetting.sscaleKeyPress(Sender: TObject; var Key: Char);
begin
     if (key in ['0'..'9','.',#8])=false then
      key:=#0;
      sScaleYuan:=sscale.Text;
end;
//*****************    ip    *************************

procedure Tsetting.ipKeyPress(Sender: TObject; var Key: Char);
begin

      if key in ['0'..'9','.',#8] then
       begin
           iptext:=trim(ip.Text);
           iptextYuan:=iptext;
           ipShuRu ;
       end
      else
          key:=#0;

end;

procedure Tsetting.ipChange(Sender: TObject);
begin

     iptext:=ip.Text;
     ipShuRu;
      if pointCount>4 then
         begin
         ip.Text:=iptextYuan;
         Application.MessageBox('IP输入有误！','信息提示',MB_OK+MB_ICONSTOP) ;
         exit;
         end;
    if ( (trim(ip11)<>'' ) and(strtoint(ip11[1])=0)) then
     begin
     Application.MessageBox('IP字段第一位不能为0','信息提示',MB_OK+MB_ICONSTOP) ;
     ip.Text:=iptextYuan;
     end;
     //*/****************************************************

    if(trim(ip11)<>'' ) and (StrToInt(ip11)>223)  then   //***************************
     begin
      
       Application.MessageBox('IP超出范围！(0-223)','信息提示',MB_OK+MB_ICONSTOP) ;
        ip.Text:=iptextYuan;
     end
    else if  (trim(ip22)<>'' ) and (StrToInt(ip22)>255)  then //********************
     begin
        Application.MessageBox('IP超出范围！(0-255)','信息提示',MB_OK+MB_ICONSTOP) ;
        ip.Text:=iptextYuan;
     end
    else if  (trim(ip33)<>'' ) and (StrToInt(ip33)>255)  then //*******************
     begin

       Application.MessageBox('IP超出范围！(0-255)','信息提示',MB_OK+MB_ICONSTOP) ;
        ip.Text:=iptextYuan;
     end
    else if  (trim(ip44)<>'' ) and (StrToInt(ip44)>255)  then  //******************
     begin
       
       Application.MessageBox('IP超出范围！(0-255)','信息提示',MB_OK+MB_ICONSTOP) ;
       ip.Text:=iptextYuan;
     end  ;
    if (length(trim(ip22)) >3 ) or  (length(trim(ip33)) >3 ) or  (length(trim(ip44)) >3 ) then
       ip.Text:=iptextYuan;
end;

procedure Tsetting.escaleChange(Sender: TObject);
begin
  EScaleCount:=0;

      for i:=1 to length(trim(escale.Text)) do
       begin
           if escale.Text[i]='.' then
              begin
              EScaleCount:=EScaleCount+1;
              if  EScaleCount>1 then  escale.Text:=EScaleYuan;
              end;
       end;

end;

procedure Tsetting.sscaleChange(Sender: TObject);
begin
      sScaleCount:=0;
      for i:=1 to length(trim(sscale.Text)) do
       begin
           if sscale.Text[i]='.' then
              begin
              sScaleCount:=sScaleCount+1;
              if  sScaleCount>1 then  sscale.Text:=sScaleYuan;
              end;
       end;
end;

end.
