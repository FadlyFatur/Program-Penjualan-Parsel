object _dm_: T_dm_
  OldCreateOrder = False
  Left = 1202
  Top = 144
  Height = 348
  Width = 259
  object ZCon_parselisme: TZConnection
    Protocol = 'mysql'
    HostName = 'localhost'
    Port = 3306
    Database = 'parselisme'
    User = 'root'
    Connected = True
    Left = 40
    Top = 16
  end
  object _produk_zq: TZQuery
    Connection = ZCon_parselisme
    SQL.Strings = (
      'select * from produk')
    Params = <>
    Left = 32
    Top = 72
    object _produk_zqprod_id: TStringField
      FieldName = 'prod_id'
      Required = True
      Size = 4
    end
    object _produk_zqprod_nama: TStringField
      FieldName = 'prod_nama'
      Required = True
      Size = 50
    end
    object _produk_zqprod_jenis: TStringField
      FieldName = 'prod_jenis'
      Required = True
      Size = 5
    end
    object _produk_zqprod_harga: TIntegerField
      FieldName = 'prod_harga'
      Required = True
      DisplayFormat = '#,#'
    end
    object _produk_zqQtyinStock: TIntegerField
      FieldName = 'QtyinStock'
    end
    object _produk_zqGambar: TBlobField
      FieldName = 'Gambar'
    end
  end
  object _cust_ds: TDataSource
    DataSet = Cust_zq
    Left = 104
    Top = 128
  end
  object order_detail_zq: TZQuery
    Connection = ZCon_parselisme
    OnCalcFields = order_detail_zqCalcFields
    SQL.Strings = (
      'select * from detail_order')
    Params = <>
    Left = 32
    Top = 192
    object order_detail_zqrc_total: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'rc_total'
      DisplayFormat = '#,#'
      Calculated = True
    end
    object order_detail_zqre_harga: TIntegerField
      FieldKind = fkLookup
      FieldName = 're_harga'
      LookupDataSet = _produk_zq
      LookupKeyFields = 'prod_id'
      LookupResultField = 'prod_harga'
      KeyFields = 'produk_id'
      DisplayFormat = '#,#'
      Lookup = True
    end
    object order_detail_zqrc_produk: TStringField
      FieldKind = fkLookup
      FieldName = 'rc_produk'
      LookupDataSet = _produk_zq
      LookupKeyFields = 'prod_id'
      LookupResultField = 'prod_nama'
      KeyFields = 'produk_id'
      Size = 30
      Lookup = True
    end
    object order_detail_zqproduk_id: TStringField
      FieldName = 'produk_id'
      Required = True
      Size = 4
    end
    object order_detail_zqid_order: TIntegerField
      FieldName = 'id_order'
    end
    object order_detail_zqquantity: TIntegerField
      FieldName = 'quantity'
      Required = True
    end
  end
  object Cust_zq: TZQuery
    Connection = ZCon_parselisme
    Active = True
    SQL.Strings = (
      'select * from customer')
    Params = <>
    Left = 32
    Top = 128
  end
  object detail_ds: TDataSource
    DataSet = order_detail_zq
    Left = 104
    Top = 192
  end
  object order_ds: TDataSource
    DataSet = Order_zq
    Left = 104
    Top = 248
  end
  object _produk_ds: TDataSource
    DataSet = _produk_zq
    Left = 104
    Top = 72
  end
  object history_zq: TZQuery
    Connection = ZCon_parselisme
    Active = True
    SQL.Strings = (
      'select * from detail_order')
    Params = <>
    Left = 176
    Top = 72
    object history_zqproduk_id: TStringField
      FieldName = 'produk_id'
      Required = True
      Size = 4
    end
    object history_zqid_order: TIntegerField
      FieldName = 'id_order'
    end
    object history_zqquantity: TIntegerField
      FieldName = 'quantity'
      Required = True
    end
    object history_zqProduk: TStringField
      FieldKind = fkLookup
      FieldName = 'Produk'
      LookupDataSet = _produk_zq
      LookupKeyFields = 'prod_id'
      LookupResultField = 'prod_nama'
      KeyFields = 'produk_id'
      Size = 30
      Lookup = True
    end
  end
  object history_ds: TDataSource
    DataSet = history_zq
    Left = 176
    Top = 128
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = order_detail_zq
    Left = 176
    Top = 248
  end
  object frxReport1: TfrxReport
    Version = '4.6.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43594.377598020800000000
    ReportOptions.LastChange = 43595.607393113420000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 176
    Top = 192
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      object PageHeader1: TfrxPageHeader
        Height = 41.574830000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        object Memo1: TfrxMemoView
          Left = 321.260050000000000000
          Width = 120.944960000000000000
          Height = 41.574830000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'gigi'
          Font.Style = []
          Memo.UTF8 = (
            'Parselism')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 64.252010000000000000
        Top = 120.944960000000000000
        Width = 793.701300000000000000
        object Date: TfrxMemoView
          Left = 151.181200000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
        end
        object Time: TfrxMemoView
          Left = 226.771800000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Time]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 188.976500000000000000
          Top = 45.354360000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'Produk')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 377.953000000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'Jumlah')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 457.323130000000000000
          Top = 45.354360000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'Harga')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 143.622140000000000000
          Top = 45.354360000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'ID')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 207.874150000000000000
        Width = 793.701300000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1produk: TfrxMemoView
          Left = 188.976500000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'rc_produk'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."rc_produk"]')
          ParentFont = False
        end
        object frxDBDataset1quantity: TfrxMemoView
          Left = 377.953000000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'quantity'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."quantity"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1harga: TfrxMemoView
          Left = 457.323130000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 're_harga'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."re_harga"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1produk_id: TfrxMemoView
          Left = 143.622140000000000000
          Width = 45.354360000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'produk_id'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."produk_id"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 86.929190000000000000
        Top = 253.228510000000000000
        Width = 793.701300000000000000
        object frxDBDataset1rc_total: TfrxMemoView
          Left = 457.323130000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'rc_total'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."rc_total"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 143.622140000000000000
          Width = 313.700990000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'Total Harga')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 249.448980000000000000
          Top = 64.252010000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Terima kasih, telah berbelanja...')
          ParentFont = False
        end
      end
    end
  end
  object Order_zq: TZQuery
    Connection = ZCon_parselisme
    Active = True
    SQL.Strings = (
      'select * from order_produk')
    Params = <>
    Left = 32
    Top = 248
  end
end
