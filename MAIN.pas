unit MAIN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, Buttons, SMDBCtrl, Grids, DBGrids,
  SMDBGrid, Mask, EditType, EDBImage, DBCtrls, ComCtrls;

type
  T_Main = class(TForm)
    produk_nav: TSMDBNavigator;
    EDBImage1: TEDBImage;
    SMDBGrid1: TSMDBGrid;
    id_tf: TDBEdit;
    id_lbl: TLabel;
    nama_lbl: TLabel;
    Image1: TImage;
    order_pnl: TPanel;
    confirm_btn: TButton;
    tambah_btn: TButton;
    qty_tf: TEdit;
    UpDown1: TUpDown;
    hargatf: TDBEdit;
    produk_tf: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    order_btn: TButton;
    Button1: TButton;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure tambah_btnClick(Sender: TObject);
    procedure confirm_btnClick(Sender: TObject);
    procedure order_btnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _Main: T_Main;
  var idCustomer,namaCust,id_order : string;

implementation

uses
  produk_, dm, cek_out, adm_pesanan, depan_;
{$R *.dfm}

procedure T_Main.BitBtn1Click(Sender: TObject);
begin
  produk_.manage_.ShowModal;
end;

procedure T_Main.tambah_btnClick(Sender: TObject);
var
  qty : string;
  harga : Integer;
begin
  qty := qty_tf.Text;
  if StrToInt(qty) = 0 then
  Application.MessageBox('Masukan jumlah.', 'Jumlah Pesanan 0', MB_OK +
    MB_ICONINFORMATION)
  else begin
  _dm_.order_detail_zq.Close;
  _dm_.order_detail_zq.SQL.Clear;
  _dm_.order_detail_zq.SQL.add('insert into detail_order (produk_id, id_order, quantity) values ("'+id_tf.Text+'","'+id_order+'","'+qty+'")');
  _dm_.order_detail_zq.ExecSQL;
  end;
  qty_tf.Text:= '0';
end;

procedure T_Main.confirm_btnClick(Sender: TObject);
begin
  _dm_.order_detail_zq.SQL.Clear;
  _dm_.order_detail_zq.SQL.Text := 'select * from detail_order where id_order =("'+id_order+'")' ;
  _dm_.order_detail_zq.Open;
  _dm_.order_detail_zq.Active;

  cek_out.id_order := id_order;
  cek_out.id_cust:=idCustomer;

  cek_out._keranjang.Show;
  Hide;
end;

procedure T_Main.order_btnClick(Sender: TObject);
begin
  produk_nav.Enabled:=True;
  order_pnl.Enabled:= True;

  _dm_.Order_zq.SQL.Clear;
  _dm_.Order_zq.SQL.Add('insert into order_produk (id_cust) values ("'+idCustomer+'") ');
  _dm_.Order_zq.ExecSQL;

  _dm_.Order_zq.SQL.Clear;
  _dm_.Order_zq.SQL.Text := 'select max(id_order) as orderid from order_produk';
  _dm_.Order_zq.Open;
  _dm_.Order_zq.Active;
  id_order := _dm_.Order_zq.FieldByName('orderid').AsString;

end;

procedure T_Main.Button1Click(Sender: TObject);
begin
  depan_._Login.Show;
  hide;
  produk_nav.Enabled:=False;
  order_pnl.Enabled:=False;
  idCustomer:='';
  id_order:='';
end;

end.
