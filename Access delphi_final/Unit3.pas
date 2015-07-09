unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtDlgs,JPEG, ExtCtrls;

type
  TJieTu_0 = class(TForm)
    SavePictureDialog1: TSavePictureDialog;
    Button2: TButton;
    Button3: TButton;
    Image1: TImage;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  JieTu_0: TJieTu_0;

implementation

uses Unit1, Unit4;


{$R *.dfm}

procedure TJieTu_0.Button3Click(Sender: TObject);
begin
close;
end;

procedure TJieTu_0.Button2Click(Sender: TObject);
var
  Str : String;
  Jpeg : TJPEGIMAGE;
begin
    if savePicturedialog1.Execute then
    begin
     Str := ExtractFileExt(savePictureDialog1.filename);
     Str := Copy(Str,2,3);
     if Str = 'bmp' then JieTu_0.Image1.Picture.SaveToFile(savePicturedialog1.FileName)
     else if Str = 'jpg' then
       begin
         Jpeg := TJPEGIMAGE.Create;
         Jpeg.Assign(JieTu_0.Image1.Picture.bitmap);
         Jpeg.SaveToFile(savePictureDialog1.FileName);
       end
     else
       ShowMessage('对不起，暂时不支持其它格式!');
    end;
end;

procedure TJieTu_0.FormCreate(Sender: TObject);
begin
Button2.Enabled :=true;
end;

end.
