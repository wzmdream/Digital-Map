unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TJieTu_1 = class(TForm)
    Shape1: TShape;
    Image1: TImage;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    StartPoint,EndPoint:TPoint;
  end;

var
  JieTu_1: TJieTu_1;

implementation

uses Unit3;

{$R *.dfm}

procedure TJieTu_1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 // label1.Visible :=false;      
  StartPoint.X :=X;
  StartPoint.Y :=Y;
  Shape1.Left :=X;
  Shape1.Top :=Y;
  Shape1.Width :=0;
  Shape1.Width :=0;
  Shape1.Visible :=true;
end;

procedure TJieTu_1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Shape1.Visible =false then exit;
  if X<StartPoint.X then
    Shape1.Left :=X
  else
    Shape1.Left :=StartPoint.X;
    Shape1.Width :=abs(X-StartPoint.X);
  if Y<StartPoint.Y then
    Shape1.Top :=Y
  else
    Shape1.Top :=StartPoint.Y;
  Shape1.Height :=abs(Y-StartPoint.Y);
end;

procedure TJieTu_1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 Bmp:Tbitmap;
begin
  StartPoint.X :=Shape1.Left;
  StartPoint.Y :=Shape1.Top;
  EndPoint.X :=Shape1.Left +Shape1.Width;
  EndPoint.Y :=Shape1.Top +Shape1.Height;
  Bmp := TBitmap.Create;
  Bmp.Width := Shape1.Width ;
  Bmp.Height := Shape1.Height ;
  Bmp.Canvas.CopyRect(Rect (0, 0, Bmp.Width, Bmp.Height),
                      Image1.Canvas,
                      Rect (StartPoint.X,StartPoint.Y,EndPoint.X,EndPoint.Y));
  JieTu_0.Image1.Picture.Bitmap :=Bmp;
  Bmp.Free;
  Shape1.Visible :=false;
  self.ModalResult :=mrOK;
end;

end.
