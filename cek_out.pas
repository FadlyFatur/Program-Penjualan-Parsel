unit cek_out;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, SMDBCtrl, Grids, DBGrids, SMDBGrid, jpeg;

type
  T_keranjang = class(TForm)
    SMDBNavigator1: TSMDBNavigator;
    Konfirmasi: TButton;
    Image1: TImage;
    SMDBGrid1: TSMDBGrid;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure KonfirmasiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _keranjang: T_keranjang;
var id_cust,namaCust,produk,harga,qty, id_order: string;
implementation

uses
  dm, MAIN, struk;
{$R *.dfm}


procedure T_keranjang.Button1Click(Sender: TObject);
begin
  _Main.Show;
  hide;
end;

procedure T_keranjang.KonfirmasiClick(Sender: TObject);
var
  id_order:string;
  i,totalHarga:Integer;
begin
  _dm_.Order_zq.SQL.Clear;
  _dm_.Order_zq.SQL.Text := 'select * from order_produk';
  _dm_.Order_zq.Open;
  _dm_.Order_zq.Active;
  totalHarga:=0;

  While not _dm_.order_detail_zq.Eof do begin
    struk._Struk.struk_mm.Lines.Add(_dm_.order_detail_zqrc_produk.AsString +'      Qty : '+_dm_.order_detail_zq.FieldByName('quantity').AsString + '      Total : Rp. ' + _dm_.order_detail_zqrc_total.AsString);
    totalHarga := totalHarga + StrToInt(_dm_.order_detail_zqrc_total.AsString);
    struk._Struk.struk_mm.Lines.Add('');
    _dm_.order_detail_zq.Next;
  end;
    struk._Struk.struk_mm.Lines.Add('Jumlah Tagihan : '+IntToStr(totalHarga));

  _Main.produk_nav.Enabled:=False;
  _Main.order_pnl.Enabled:=False;

  struk._Struk.Show;
  hide;
end;

end.
