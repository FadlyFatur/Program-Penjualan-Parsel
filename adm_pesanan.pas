unit adm_pesanan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SMDBCtrl, Grids, DBGrids, SMDBGrid, jpeg, StdCtrls,
  Mask, DBCtrls;

type
  TPesanan_ = class(TForm)
    SMDBGrid2: TSMDBGrid;
    Image1: TImage;
    SMDBNavigator1: TSMDBNavigator;
    Label1: TLabel;
    Button1: TButton;
    id_ordertf: TEdit;
    SMDBGrid1: TSMDBGrid;
    procedure Image1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pesanan_: TPesanan_;

implementation

uses
  dm;

{$R *.dfm}

procedure TPesanan_.Image1Click(Sender: TObject);
begin
_dm_.Order_zq.Active;
end;

procedure TPesanan_.Button1Click(Sender: TObject);
begin
  _dm_.history_zq.SQL.Text:='select * from detail_order where id_order = "'+id_ordertf.Text+'" ';
  _dm_.history_zq.Active:=True;
end;

end.
