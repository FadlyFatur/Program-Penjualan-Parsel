unit depan_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, ExtCtrls, jpeg;

type
  T_Login = class(TForm)
    Button1: TButton;
    Button2: TButton;
    usertf: TEdit;
    passtf: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    XPManifest1: TXPManifest;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _Login: T_Login;
  var idCustomer,namaCust : string;

implementation

{$R *.dfm}
uses
  MAIN, login, dm, produk_;


procedure T_Login.Button1Click(Sender: TObject);
begin
  login._daftar.Show;
  hide;
end;


procedure T_Login.Button2Click(Sender: TObject);
 var
 i : Integer;
 a,b,c : string;
begin
 _dm_.Cust_zq.SQL.Text := 'SELECT * FROM customer';
 _dm_.Cust_zq.Active := True;

 if (usertf.Text = '') or (passtf.Text = '') then
  Application.MessageBox('Email dan Password tidak boleh kosong', 'INFORMASI', mb_OK);

 for i := 1 to _dm_.Cust_zq.RecordCount do begin
   a := string(_dm_.Cust_zq['cust_username']);
   b := string(_dm_.Cust_zq['cust_pass']);
   c:= string(_dm_.Cust_zq['level']);

 if((usertf.Text = a) and (passtf.Text = b))then begin

      if c='admin' then
      begin
        produk_.manage_.Show;
        Hide;
//        MAIN.idCustomer :=  _dm_.Cust_zq.FieldByName('cust_id').AsString;
//        produk_.idCustomer :=  _dm_.Cust_zq.FieldByName('cust_id').AsString;
//        MAIN.namaCust := _dm_.Cust_zq.FieldByName('cust_nama').AsString;
//        MAIN._Main.id_lbl.Caption := _dm_.Cust_zq.FieldByName('cust_id').AsString;
//        MAIN._Main.nama_lbl.Caption := _dm_.Cust_zq.FieldByName('cust_nama').AsString;
          _dm_.Order_zq.SQL.Clear;
          _dm_.Order_zq.SQL.Text := 'select * from order_produk';
          _dm_.Order_zq.Open;
        _dm_._produk_zq.Active;
        _dm_.Order_zq.Active;
        Break;

      end
      else begin
        MAIN._Main.Show;
        Hide;
        MAIN.idCustomer :=  _dm_.Cust_zq.FieldByName('cust_id').AsString;
        MAIN.namaCust := _dm_.Cust_zq.FieldByName('cust_nama').AsString;
        MAIN._Main.id_lbl.Caption := _dm_.Cust_zq.FieldByName('cust_id').AsString;
        MAIN._Main.nama_lbl.Caption := _dm_.Cust_zq.FieldByName('cust_nama').AsString;
        _dm_._produk_zq.Active;
        Break;
        end;

    end;
    if ((usertf.Text=a) and (passtf.Text<>b))then begin
        Application.MessageBox('Maaf password anda salah!!', 'Eror', MB_OK +
          MB_ICONSTOP);
        Break;
      end
    else if ((usertf.Text<>a) and (passtf.Text=b))then begin
        Application.MessageBox('Maaf username anda salah', 'Eror', MB_OK +
          MB_ICONSTOP);
        Break;
      end;
      _dm_.Cust_zq.Next;

 end;
  usertf.Text:='';
  passtf.Text:='';
  
 end;
end.
