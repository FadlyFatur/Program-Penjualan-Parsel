unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  T_daftar = class(TForm)
    Namatf: TEdit;
    Label1: TLabel;
    usertf: TEdit;
    Label2: TLabel;
    Passtf: TEdit;
    Label3: TLabel;
    phonetf: TEdit;
    Label4: TLabel;
    Kotatf: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    mm_alamat: TMemo;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _daftar: T_daftar;

implementation

{$R *.dfm}

uses
  dm, depan_;

procedure T_daftar.Button1Click(Sender: TObject);
begin
    if (Namatf.Text='') or (usertf.Text='') or (Passtf.Text='') then
    Application.MessageBox('Data belum lengkap', 'INFORMASI', mb_OK)
    else begin
      with _dm_.Cust_zq do begin
      _dm_.Cust_zq.Close;
      _dm_.Cust_zq.SQL.Clear;
      _dm_.Cust_zq.SQL.Add('select * from customer where cust_username = "'+usertf.Text+'"');
      _dm_.Cust_zq.Open;
      _dm_.Cust_zq.Active;

      if _dm_.Cust_zq.RecordCount=0 then begin
        _dm_.Cust_zq.SQL.Clear;
        _dm_.Cust_zq.SQL.Add('insert into customer(cust_nama,cust_username,cust_pass,cust_phone,cust_kota,cust_alamat) values("'+Namatf.Text+'","'+usertf.text+'","'+Passtf.text+'","'+phonetf.text+'","'+Kotatf.text+'","'+mm_alamat.text+'")');
        _dm_.Cust_zq.ExecSQL;
      Application.MessageBox('Anda sudah terdaftar dan bisa melakukan login',
        'Input berhasil', MB_OK + MB_ICONINFORMATION);
      end
      else
        Application.MessageBox('Input Gagal, Akun Sudah terdaftar', 'INFORMASI', mb_OK);
      end;

     end;

  _dm_.Cust_zq.SQL.Clear;
  _dm_.Cust_zq.SQL.Add('select * from customer');
  _dm_.Cust_zq.Active;


  Namatf.Text:='';
  usertf.Text:='';
  Passtf.Text:='';
  phonetf.Text:='';
  Kotatf.Text:='';
  mm_alamat.Text:='';

  Namatf.SetFocus;
end;

procedure T_daftar.Button3Click(Sender: TObject);
begin
 depan_._Login.Show;
 Hide;
 depan_._Login.Enabled:=true;
end;

procedure T_daftar.Button2Click(Sender: TObject);
begin
  Namatf.Text:='';
  usertf.Text:='';
  Passtf.Text:='';
  phonetf.Text:='';
  Kotatf.Text:='';
  mm_alamat.Text:='';
end;

end.
