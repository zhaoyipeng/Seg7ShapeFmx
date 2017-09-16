unit GingoMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Objects,
  Seg7ShapeFmx, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TMainForm = class(TForm)
    Timer1: TTimer;
    Button1: TButton;
    Seg7Shape1: TSeg7Shape;
    Seg7Shape2: TSeg7Shape;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private êÈåæ }
    procedure RollSegment(Sender: TObject ; Data : Byte );
    procedure RollSegmentSet( Count : Byte);
  public
    { public êÈåæ }
  end;

var
  MainForm: TMainForm;
  ShuffleCount : Byte;

implementation

{$R *.fmx}

procedure TMainForm.Button1Click(Sender: TObject);
begin
  Timer1.Enabled  := TRUE;
  Button1.Enabled := False;
  ShuffleCount     := 17;
  Seg7Shape1.Num  := $ff;
  Seg7Shape2.Num  := $ff;
  Randomize;
  Seg7Shape1.Fill.Color := Seg7Shape1.Fill.Color + Random($ffffffff);
  Seg7Shape2.Fill.Color := Seg7Shape1.Fill.Color + Random($ffffffff);
  RollSegmentSet( ShuffleCount );
end;


procedure TMainForm.RollSegment(Sender: TObject ; Data : Byte );
begin
  (Sender As TSeg7Shape).Data := Data;
end;

procedure TMainForm.RollSegmentSet( Count : Byte);
BEGIN
  case Count of
     17,9,1 : begin  RollSegment(Seg7Shape1 , $01 );  RollSegment(Seg7Shape2 , $01 ); end;
     16,8 : begin  RollSegment(Seg7Shape1 , $00 );  RollSegment(Seg7Shape2 , $03 ); end;
     15,7 : begin  RollSegment(Seg7Shape1 , $00 );  RollSegment(Seg7Shape2 , $06 ); end;
     14,6 : begin  RollSegment(Seg7Shape1 , $00 );  RollSegment(Seg7Shape2 , $0C ); end;
     13,5 : begin  RollSegment(Seg7Shape1 , $08 );  RollSegment(Seg7Shape2 , $08 ); end;
     12,4 : begin  RollSegment(Seg7Shape1 , $18 );  RollSegment(Seg7Shape2 , $00 ); end;
     11,3 : begin  RollSegment(Seg7Shape1 , $30 );  RollSegment(Seg7Shape2 , $00 ); end;
     10,2 : begin  RollSegment(Seg7Shape1 , $21 );  RollSegment(Seg7Shape2 , $00 ); end;
  end;
end;
procedure TMainForm.Timer1Timer(Sender: TObject);
var
    RandData: Byte;
begin
  if (ShuffleCount = 0) then
  begin
    RandData := Random(100);
    Seg7Shape1.Num := RandData mod 10;
    Seg7Shape2.Num := RandData div 10;
    Timer1.Enabled := False;
    Button1.Enabled := TRUE;
    Seg7Shape1.Fill.Color := TAlphaColorRec.Blue;
    Seg7Shape2.Fill.Color := TAlphaColorRec.Blue;
  end
  else
  begin
    Seg7Shape1.Fill.Color := Seg7Shape1.Fill.Color + Random($FFFFFFFF);
    Seg7Shape2.Fill.Color := Seg7Shape1.Fill.Color + Random($FFFFFFFF);
    Dec(ShuffleCount);
    RollSegmentSet(ShuffleCount);
  end;
end;

end.
