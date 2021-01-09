unit struk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  T_Struk = class(TForm)
    struk_mm: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _Struk: T_Struk;

var idCustomer,namaCust : string;

implementation

uses
  MAIN, dm, depan_;

{$R *.dfm}



procedure T_Struk.Button1Click(Sender: TObject);
begin
  _dm_.frxReport1.ShowReport;
end;

procedure T_Struk.Button3Click(Sender: TObject);
begin
  MAIN._Main.Show;
  Close;
  struk_mm.Clear;
  MAIN._Main.produk_nav.Enabled:=False;
  MAIN._Main.order_pnl.Enabled:=False;

  _dm_.Cust_zq.SQL.Clear;
  _dm_.Cust_zq.SQL.Add('select * from customer');
  _dm_.Cust_zq.Active;

  _dm_.Order_zq.SQL.Clear;
  _dm_.Order_zq.SQL.Add('select * from order_produk');
  _dm_.Order_zq.Active;

  _dm_.order_detail_zq.SQL.Clear;
  _dm_.order_detail_zq.SQL.Add('select * from order_detail');
  _dm_.order_detail_zq.Active;
end;

procedure T_Struk.Button2Click(Sender: TObject);
begin
  depan_._Login.Show;
  Close;
  struk_mm.Clear;
  MAIN.idCustomer:='';
  MAIN.id_order:='';
  MAIN._Main.produk_nav.Enabled:=False;
  MAIN._Main.order_pnl.Enabled:=False;

  _dm_.Cust_zq.SQL.Clear;
  _dm_.Cust_zq.SQL.Add('select * from customer');
  _dm_.Cust_zq.Active;

  _dm_.Order_zq.SQL.Clear;
  _dm_.Order_zq.SQL.Add('select * from order_produk');
  _dm_.Order_zq.Active;

  _dm_.order_detail_zq.SQL.Clear;
  _dm_.order_detail_zq.SQL.Add('select * from order_detail');
  _dm_.order_detail_zq.Active;
end;

end.
