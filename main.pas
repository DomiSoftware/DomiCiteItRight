unit main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.TabControl, FMX.Layouts, FMX.TreeView,
  FMX.Edit, FMX.Objects,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, System.DateUtils,
  FMX.AddressBook.Types, FMX.AddressBook, FMX.ListBox, FMX.WebBrowser,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.SQLite, Fmx.DialogService,
{$IFDEF ANDROID}
  FMX.Helpers.Android,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Net,
  Androidapi.JNI,
  Androidapi.JNI.App,
  Androidapi.Helpers,
  Androidapi.JNI.Telephony,
  Androidapi.JNI.Provider,
  Androidapi.JNI.Os,
{$ENDIF ANDROID}
  System.uiconsts,System.IOUtils, Data.Bind.Controls, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Fmx.Bind.Navigator, Data.Bind.DBScope;
type
  TCiteRaw = Record
    zProject: string;
    zModule: string;
    zSubject: string;
    zCreated: string;
    zType: string;
    zBibOnly: string;
    z01: String;
    z02: String;
    z03: String;
    z04: String;
    z05: String;
    z06: String;
    z07: String;
    z08: String;
    z09: string;
    z10: string;
    z11: string;
    o01: string;
    o02: string;
    o03: string;
    zCiteInline: string;
    zCiteInline2: string;
    zCiteHarvard: string;
  end;

  TForm3 = class(TForm)
    Panel9: TPanel;
    ebProject: TEdit;
    ebModule: TEdit;
    ebSubject: TEdit;
    Panel13: TPanel;
    Button5: TButton;
    Panel14: TPanel;
    Button1: TButton;
    Panel15: TPanel;
    Panel4: TPanel;
    Label4: TLabel;
    eb01: TEdit;
    eb02: TEdit;
    eb03: TEdit;
    eb04: TEdit;
    eb08: TEdit;
    eb09: TEdit;
    eb10: TEdit;
    eb11: TEdit;
    EBOL02: TEdit;
    eb06: TEdit;
    eb05: TEdit;
    eb07: TEdit;
    EBOL01: TEdit;
    EBOL03: TEdit;
    Button3: TButton;
    Label1: TLabel;
    Panel7: TPanel;
    Panel10: TPanel;
    Label3: TLabel;
    Memo1: TMemo;
    Label6: TLabel;
    Label2: TLabel;
    CIR_ILR1: TEdit;
    cbBibliogOnly: TCheckBox;
    Memo2: TMemo;
    DTA: TFDConnection;
    BindingsList1: TBindingsList;
    TPrj: TFDTable;
    GO: TFDCommand;
    FDTU: TFDTransaction;
    FDT: TFDTransaction;
    FDT2: TFDTransaction;
    Del: TButton;
    Panel1: TPanel;
    bFirst: TButton;
    bLast: TButton;
    bNext: TButton;
    bPrev: TButton;
    Apply: TButton;
    TCite: TFDTable;
    Label7: TLabel;
    Button2: TButton;
    Panel5: TPanel;
    TCiteciteid: TFDAutoIncField;
    TCiteproj: TIntegerField;
    TCitetyp: TWideMemoField;
    TCiteeb01: TWideMemoField;
    TCiteeb02: TWideMemoField;
    TCiteeb03: TWideMemoField;
    TCiteeb04: TWideMemoField;
    TCiteeb05: TWideMemoField;
    TCiteeb06: TWideMemoField;
    TCiteeb07: TWideMemoField;
    TCiteeb08: TWideMemoField;
    TCiteeb09: TWideMemoField;
    TCiteeb10: TWideMemoField;
    TCiteeb11: TWideMemoField;
    TCiteol1: TWideMemoField;
    TCiteol2: TWideMemoField;
    TCiteol3: TWideMemoField;
    TCiteinl1: TWideMemoField;
    TCiteinl2: TWideMemoField;
    TCiteref: TWideMemoField;
    TCitebiblio: TWideMemoField;
    TCitecreated: TWideMemoField;
    TPrjprojid: TFDAutoIncField;
    TPrjproj_name: TWideMemoField;
    TPrjproj_modl: TWideMemoField;
    TPrjproj_subj: TWideMemoField;
    TPrjproj_creat: TWideMemoField;
    Button4: TButton;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox1: TGroupBox;
    rgBookAuth: TRadioButton;
    rgBookOrgAuth: TRadioButton;
    rgBookReprint: TRadioButton;
    rgBookNoAuth: TRadioButton;
    rgBookFacsimile: TRadioButton;
    rgBookChap: TRadioButton;
    rgBookCollected: TRadioButton;
    rgAnthology: TRadioButton;
    rgAnthologyLine: TRadioButton;
    rgReference: TRadioButton;
    rgBible: TRadioButton;
    rgJournalArt: TRadioButton;
    rgJournalWhole: TRadioButton;
    rgWebAuth: TRadioButton;
    rgWebOrg: TRadioButton;
    rgWebNoAuth: TRadioButton;
    rgSocialMedia: TRadioButton;
    rgNewsByline: TRadioButton;
    rgNewsNoByline: TRadioButton;
    rgPodcast: TRadioButton;
    rgRadio: TRadioButton;
    rgPainting: TRadioButton;
    rgPhotographicPrint: TRadioButton;
    rgPhotographWeb: TRadioButton;
    rgTVSingle: TRadioButton;
    rgTVEpisodeSeries: TRadioButton;
    rgMovies: TRadioButton;
    rgVLELectureNotes: TRadioButton;
    rgVLETutorHandout: TRadioButton;
    rgVLEModule: TRadioButton;
    rgConfPaper: TRadioButton;
    rgBookPartChap: TRadioButton;
    TabControl2: TTabControl;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    TabItem6: TTabItem;
    Panel3: TPanel;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Label5: TLabel;
    Button12: TButton;
    Label8: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure rgBookAuthMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ApplyClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure TPrjAfterScroll(DataSet: TDataSet);
    procedure DelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DTAAfterConnect(Sender: TObject);
    procedure bFirstClick(Sender: TObject);
    procedure bPrevClick(Sender: TObject);
    procedure bNextClick(Sender: TObject);
    procedure bLastClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure TCiteAfterScroll(DataSet: TDataSet);
    procedure Button4Click(Sender: TObject);
    procedure DTABeforeConnect(Sender: TObject);
    procedure Button12Click(Sender: TObject);
  private
    procedure BuildCIR(st: string);
    procedure ApplyM;
    procedure DroidAlert(msg: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  CIR: TCiteRaw;
  tmpCIRB, CIR_INL1, CIR_INL2, CIR_BIBLIO: string;
  gPRJ,gCITE :integer;
  isoup:boolean;

implementation

{$R *.fmx}

procedure TForm3.Button10Click(Sender: TObject);
begin
  TCite.Next;
  Label5.Text:=IntToStr(TCite.RecNo)+'/'+IntToStr(TCite.RecordCount);
end;

procedure TForm3.Button11Click(Sender: TObject);
begin
  TCite.Prior;
  Label5.Text:=IntToStr(TCite.RecNo)+'/'+IntToStr(TCite.RecordCount);
end;

procedure TForm3.Button12Click(Sender: TObject);
begin
  TabControl2.ActiveTab:=TabItem4;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  eb01.Text := '';
  eb02.Text := '';
  eb03.Text := '';
  eb04.Text := '';
  eb05.Text := '';
  eb06.Text := '';
  eb07.Text := '';
  eb08.Text := '';
  eb09.Text := '';
  eb10.Text := '';
  eb11.Text := '';
  EBOL01.Text := '';
  EBOL02.Text := '';
  EBOL03.Text := '';
//  cbOnline.IsChecked := false;
  Memo1.Lines.Clear;
  CIR_ILR1.Text:='';
  Memo2.Lines.Clear;
  TabControl2.ActiveTab:=TabItem4;
  end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  EBOL03.Text := formatdatetime('dd mmmm yyyy', Now);
end;

procedure TForm3.Button4Click(Sender: TObject);
var sg:TMemo;
begin
  sg:=TMemo.Create(self);
  sg.Lines.Clear;
  TCite.First;
  isoup:=true;
  while not (Tcite.Eof) do
  begin
    sg.Lines.Add(Tcite.FieldByName('ref').AsString);
    Tcite.Next;
  end;
  isoup:=false;
  sg.Lines.SaveToFile('CIR_'+ebProject.Text+'.txt');
  sg.Free;
  ShowMessage('file created');
end;

procedure TForm3.Button5Click(Sender: TObject);
var s: string;
begin
//try
// begin
  TPrj.Last;
  s:='insert into project([proj_name],[proj_modl],[proj_subj],[proj_creat]) '+
     'values ("'+trim(ebProject.Text)+'","'+
     trim(ebModule.Text)+'","'+
     trim(ebSubject.Text)+'","'+
     formatdatetime('yyyy/mm/dd', Now)+'")';
//  TPrj.FieldByName('proj_modl').AsString:=trim(ebModule.Text);
//  TPrj.FieldByName('proj_subj').AsString:=trim(ebSubject.Text);
//  TPrj.FieldByName('proj_creat').AsString:= formatdatetime('yyyy/mm/dd', Now);
//  TPrj.Post;
//    Go.CommandText:=s;
    GO.Execute(s);
    Tprj.Refresh;
    TPrj.Last;
  Label7.Text:=IntToStr(TPrj.RecNo)+'/'+IntToStr(TPrj.RecordCount);

// end;
//  except on E: Exception do
//  ShowMessage('nope, just nope!!');
//end;
end;

procedure TForm3.Button6Click(Sender: TObject);
var s: string;
begin
  if gCITE=0 then
  begin
  TCite.Last;
  s:='insert into citeme('+
     '[proj],[typ],[eb01],'+
     '[eb02],[eb03],[eb04],'+
     '[eb05],[eb06],[eb07],'+
     '[eb08],[eb09],[eb10],[eb11],'+
     '[ol1],[ol2],[ol3],[inl1],[inl2],[ref],'+
     '[biblio],[created]'+
     ')  values ('+
     inttostr(gPRJ)+',"'+
     CIR.zType+'","'+
     trim(eb01.Text)+'","'+
     trim(eb02.Text)+'","'+
     trim(eb03.Text)+'","'+
     trim(eb04.Text)+'","'+
     trim(eb05.Text)+'","'+
     trim(eb06.Text)+'","'+
     trim(eb07.Text)+'","'+
     trim(eb08.Text)+'","'+
     trim(eb09.Text)+'","'+
     trim(eb10.Text)+'","'+
     trim(eb11.Text)+'","'+
     trim(EBOL01.Text)+'","'+
     trim(EBOL02.Text)+'","'+
     trim(EBOL03.Text)+'","'+
     trim(CIR_ILR1.Text)+'","'+
     trim(Memo1.lines.Text)+'","'+
     trim(Memo2.Lines.Text)+'","';
     if cbBibliogOnly.IsChecked=true then
     s:=s+'TRUE","' else s:=s+'FALSE","';
     s:=s+formatdatetime('yyyy/mm/dd', Now)+'")';
    GO.Execute(s);
    TCite.Refresh;
    TCite.Last;
  Label5.Text:=IntToStr(TCite.RecNo)+'/'+IntToStr(TCite.RecordCount);
  end else
  begin
  s:='update citeme set '+
     '[proj]='+inttostr(gPRJ)+','+
     '[typ]="'+CIR.zType+'",'+
     '[eb01]="'+trim(eb01.Text)+'",'+
     '[eb02]="'+trim(eb02.Text)+'",'+
     '[eb03]="'+trim(eb03.Text)+'",'+
     '[eb04]="'+trim(eb04.Text)+'",'+
     '[eb05]="'+trim(eb05.Text)+'",'+
     '[eb06]="'+trim(eb06.Text)+'",'+
     '[eb07]="'+trim(eb07.Text)+'",'+
     '[eb08]="'+trim(eb08.Text)+'",'+
     '[eb09]="'+trim(eb09.Text)+'",'+
     '[eb10]="'+trim(eb10.Text)+'",'+
     '[eb11]="'+trim(eb11.Text)+'",'+
     '[ol1]="'+trim(EBOL01.Text)+'",'+
     '[ol2]="'+trim(EBOL02.Text)+'",'+
     '[ol3]="'+trim(EBOL03.Text)+'",'+
     '[inl1]="'+trim(CIR_ILR1.Text)+'",'+
     '[inl2]="'+trim(Memo1.Lines.Text)+'",'+
     '[ref]="'+trim(Memo2.Lines.Text)+'",';
     if cbBibliogOnly.IsChecked=true then
     s:=s+'[biblio]="TRUE",' else s:=s+'[biblio]="FALSE",';
     s:=s+'[created]="'+formatdatetime('yyyy/mm/dd', Now);
     s:=s+'" where citeid='+inttostr(gCITE);
    GO.Execute(s);
    TCite.Refresh;
    TCite.Last;
  Label5.Text:=IntToStr(TCite.RecNo)+'/'+IntToStr(TCite.RecordCount);

  end;

end;

procedure TForm3.Button7Click(Sender: TObject);
var s:string;
begin
  s:='delete from citeme where citeid='+inttostr(gCITE);
  GO.Execute(s);
  TCite.Refresh;
  Label5.Text:=IntToStr(TCite.RecNo)+'/'+IntToStr(TCite.RecordCount);
  if TCite.RecordCount = 0 then
  begin
    eb01.Text := '';
    eb02.Text := '';
    eb03.Text := '';
    eb04.Text := '';
    eb05.Text := '';
    eb06.Text := '';
    eb07.Text := '';
    eb08.Text := '';
    eb09.Text := '';
    eb10.Text := '';
    eb11.Text := '';
    EBOL01.Text := '';
    EBOL02.Text := '';
    EBOL03.Text := '';
//  cbOnline.IsChecked := false;
    Memo1.Lines.Clear;
    CIR_ILR1.Text:='';
    Memo2.Lines.Clear;
  end;

end;

procedure TForm3.Button8Click(Sender: TObject);
begin
  TCite.First;
  Label5.Text:=IntToStr(TCite.RecNo)+'/'+IntToStr(TCite.RecordCount);
end;

procedure TForm3.Button9Click(Sender: TObject);
begin
  TCite.Last;
  Label5.Text:=IntToStr(TCite.RecNo)+'/'+IntToStr(TCite.RecordCount);
end;

procedure TForm3.DelClick(Sender: TObject);
var s:string;
begin
  s:='delete from project where projid='+inttostr(gPRJ);
  GO.Execute(s);
  TPrj.Refresh;
  if Tprj.RecordCount=0 then
  begin
  gPRJ:=0;
//  gPRJ:=tPRJ.FieldByName('projid').AsInteger;
  ebProject.Text:='';
  ebModule.Text:='';
  ebSubject.Text:='';
  end;
  Label7.Text:=IntToStr(TPrj.RecNo)+'/'+IntToStr(TPrj.RecordCount);
end;

procedure TForm3.DTAAfterConnect(Sender: TObject);
var s:string;
begin

s:='CREATE TABLE IF NOT EXISTS "project" (';
s:=s+'"projid"	INTEGER NOT NULL,';
s:=s+'"proj_name"	TEXT NOT NULL UNIQUE, ';
s:=s+'"proj_modl"	TEXT, ';
s:=s+'"proj_subj"	TEXT, ';
s:=s+'"proj_creat"	TEXT, ';
s:=s+'PRIMARY KEY("projid" AUTOINCREMENT)';
s:=s+')';
Go.Execute(s);

s:='CREATE TABLE IF NOT EXISTS "citeme" (';
s:=s+'"citeid"	INTEGER NOT NULL,';
s:=s+'"proj"	INTEGER NOT NULL,';
s:=s+'"typ"	TEXT,';
s:=s+'"eb01"	TEXT,';
s:=s+'"eb02"	TEXT,';
s:=s+'"eb03"	TEXT,';
s:=s+'"eb04"	TEXT,';
s:=s+'"eb05"	TEXT,';
s:=s+'"eb06"	TEXT,';
s:=s+'"eb07"	TEXT,';
s:=s+'"eb08"	TEXT,';
s:=s+'"eb09"	TEXT,';
s:=s+'"eb10"	TEXT,';
s:=s+'"eb11"	TEXT,';
s:=s+'"ol1"	TEXT,';
s:=s+'"ol2"	TEXT,';
s:=s+'"ol3"	TEXT,';
s:=s+'"inl1"	TEXT,';
s:=s+'"inl2"	TEXT,';
s:=s+'"ref"	TEXT,';
s:=s+'"biblio"	TEXT,';
s:=s+'"created"	TEXT,';
s:=s+'PRIMARY KEY("citeid" AUTOINCREMENT)';
s:=s+')';
Go.Execute(s);


  TPrj.Active:=true;
  TPrj.First;


  Label7.Text:=IntToStr(TPrj.RecNo)+'/'+IntToStr(TPrj.RecordCount);



end;

procedure TForm3.DroidAlert(msg: string);
begin
  TDialogService.MessageDialog((msg), System.UITypes.TMsgDlgType.mtConfirmation,
    [System.UITypes.TMsgDlgBtn.mbOK], System.UITypes.TMsgDlgBtn.mbOK, 0,
    procedure(const AResult: System.UITypes.TModalResult)
    begin
//      gflag := 'N';
      case AResult of
        mrOk:
//          gflag := 'Y';
      end;
    end);
end;

procedure TForm3.DTABeforeConnect(Sender: TObject);
var dfn:string;
begin
  {$IF DEFINED(mswindows)}
    dfn := TPath.Combine(ExtractFilePath(ParamStr(0)), 'cite.sqlite');
  {$ENDIF}
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
    dfn := TPath.Combine(TPath.GetDocumentsPath, 'cite.sqlite');
  {$ENDIF}
//  if not(FileExists(dfn)) = true then
//  begin
//    DroidAlert(dfn+' missing');
//    sleep(3000);
//    Close;
//  end;
  DTA.Params.Values['Database']:=dfn;


end;



procedure TForm3.FormCreate(Sender: TObject);
begin
  if DTA.Connected=false then DTA.Connected:=true;

end;

procedure TForm3.rgBookAuthMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  ApplyM;
end;

procedure TForm3.TCiteAfterScroll(DataSet: TDataSet);
begin
  if isoup=true then exit;

  if TCite.FieldByName('biblio').AsString='"TRUE"' then cbBibliogOnly.IsChecked:=true
  else cbBibliogOnly.IsChecked:=false;


  if TCite.FieldByName('typ').AsString='BK:AUTH' then rgBookAuth.IsChecked:=True else rgBookAuth.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='BK:NOAUTH' then rgBookNoAuth.IsChecked:=True else rgBookNoAuth.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='BK:ORG' then rgBookOrgAuth.IsChecked:=True else rgBookOrgAuth.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='BK:REPR' then rgBookReprint.IsChecked:=True else rgBookReprint.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='BK:FACS' then rgBookFacsimile.IsChecked:=True else rgBookFacsimile.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='BK:ANTH' then rgAnthology.IsChecked:=True else rgAnthology.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='BK:ANLN' then rgAnthologyLine.IsChecked:=True else rgAnthologyLine.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='BK:REF' then rgReference.IsChecked:=True else rgReference.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='BK:BIBL' then rgBible.IsChecked:=True else rgBible.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='BK:COLL' then rgBookCollected.IsChecked:=True else rgBookCollected.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='BK:CHAP' then rgBookChap.IsChecked:=True else rgBookChap.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='BK:CHPT' then rgBookPartChap.IsChecked:=True else rgBookPartChap.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='JN:ART' then rgJournalArt.IsChecked:=True else rgJournalArt.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='JN:FULL' then rgJournalWhole.IsChecked:=True else rgJournalWhole.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='WW:AUTH' then rgWebAuth.IsChecked:=True else rgWebAuth.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='WW:ORG' then rgWebOrg.IsChecked:=True else rgWebOrg.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='WW:NONE' then rgWebNoAuth.IsChecked:=True else rgWebNoAuth.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='SM:ALL' then rgSocialMedia.IsChecked:=True else rgSocialMedia.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='NW:BYLN' then rgNewsByline.IsChecked:=True else rgNewsByline.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='NW:NOBY' then rgNewsNoByline.IsChecked:=True else rgNewsNoByline.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='AR:PNTG' then rgPainting.IsChecked:=True else rgPainting.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='AR:PHBK' then rgPhotographicPrint.IsChecked:=True else rgPhotographicPrint.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='AR:PHWW' then rgPhotographWeb.IsChecked:=True else rgPhotographWeb.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='AV:PODC' then rgPodcast.IsChecked:=True else rgPodcast.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='AV:RDIO' then rgRadio.IsChecked:=True else rgRadio.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='AV:TV' then rgTVSingle.IsChecked:=True else rgTVSingle.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='AV:TVSE' then rgTVEpisodeSeries.IsChecked:=True else rgTVEpisodeSeries.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='AV:MOVI' then rgMovies.IsChecked:=True else rgMovies.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='VL:NTES' then rgVLELectureNotes.IsChecked:=True else rgVLELectureNotes.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='VL:HAND' then rgVLETutorHandout.IsChecked:=True else rgVLETutorHandout.IsChecked:=False;
  if TCite.FieldByName('typ').AsString='CF:PAPR' then rgConfPaper.IsChecked:=True else rgConfPaper.IsChecked:=False;

//     '[proj]='+inttostr(gPRJ)+','+
  CIR.zType:=Tcite.FieldByName('typ').AsString;
  eb01.Text:=Tcite.FieldByName('eb01').AsString;
  eb02.Text:=Tcite.FieldByName('eb02').AsString;
  eb03.Text:=Tcite.FieldByName('eb03').AsString;
  eb04.Text:=Tcite.FieldByName('eb04').AsString;
  eb05.Text:=Tcite.FieldByName('eb05').AsString;
  eb06.Text:=Tcite.FieldByName('eb06').AsString;
  eb07.Text:=Tcite.FieldByName('eb07').AsString;
  eb08.Text:=Tcite.FieldByName('eb08').AsString;
  eb09.Text:=Tcite.FieldByName('eb09').AsString;
  eb10.Text:=Tcite.FieldByName('eb10').AsString;
  eb11.Text:=Tcite.FieldByName('eb11').AsString;
  EBOL01.Text:=Tcite.FieldByName('ol1').AsString;
  EBOL02.Text:=Tcite.FieldByName('ol2').AsString;
  EBOL03.Text:=Tcite.FieldByName('ol3').AsString;
  CIR_ILR1.Text:=Tcite.FieldByName('inl1').AsString;
  Memo1.Lines.clear;
  Memo1.Lines.Add(Tcite.FieldByName('inl2').AsString);
  Memo2.Lines.clear;
  Memo2.Lines.Add(Tcite.FieldByName('ref').AsString);
  Label5.Text:=IntToStr(TCite.RecNo)+'/'+IntToStr(TCite.RecordCount);
  gCITE:=Tcite.FieldByName('citeid').AsInteger;
  ApplyM;
end;

procedure TForm3.TPrjAfterScroll(DataSet: TDataSet);
begin
  gPRJ:=0;
  if TPrj.RecordCount=0 then exit;
  gPRJ:=tPRJ.FieldByName('projid').AsInteger;
  ebProject.Text:=tPRJ.FieldByName('proj_name').AsString;
  ebModule.Text:=tPRJ.FieldByName('proj_modl').AsString;
  ebSubject.Text:=tPRJ.FieldByName('proj_subj').AsString;
  TCite.Active:=false;
  Tcite.SQL.Clear;
  Tcite.SQL.Add('select * from citeme where proj='+IntToStr(gPRJ));
  TCite.Active:=True;
end;

//build parts
procedure TForm3.ApplyClick(Sender: TObject);
begin
  gCITE:=0;
  eb01.Text := '';
  eb02.Text := '';
  eb03.Text := '';
  eb04.Text := '';
  eb05.Text := '';
  eb06.Text := '';
  eb07.Text := '';
  eb08.Text := '';
  eb09.Text := '';
  eb10.Text := '';
  eb11.Text := '';
  EBOL01.Text := '';
  EBOL02.Text := '';
  EBOL03.Text := '';
//  cbOnline.IsChecked := false;
  Memo1.Lines.Clear;
  CIR_ILR1.Text:='';
  Memo2.Lines.Clear;
  ApplyM;
  TabControl2.ActiveTab:=TabItem5;
end;

procedure TForm3.ApplyM;
begin
  eb01.Enabled := True;
  eb02.Enabled := True;
  eb03.Enabled := True;
  eb04.Enabled := True;
  eb05.Enabled := True;
  eb06.Enabled := True;
  eb07.Enabled := True;
  eb08.Enabled := True;
  eb09.Enabled := True;
  eb10.Enabled := True;
  eb11.Enabled := True;
  EBOL01.Enabled := True;
  EBOL02.Enabled := True;
  EBOL03.Enabled := True;
  eb01.TextPrompt := ' ';
  eb02.TextPrompt := ' ';
  eb03.TextPrompt := ' ';
  eb04.TextPrompt := ' ';
  eb05.TextPrompt := ' ';
  eb06.TextPrompt := ' ';
  eb07.TextPrompt := ' ';
  eb08.TextPrompt := ' ';
  eb09.TextPrompt := ' ';
  eb10.TextPrompt := ' ';
  eb11.TextPrompt := ' ';
  EBOL01.TextPrompt := ' ';
  EBOL02.TextPrompt := ' ';
  EBOL03.TextPrompt := ' ';
  CIR.zProject := ebProject.Text;
  CIR.zModule := ebModule.Text;
  CIR.zSubject := ebSubject.Text;
  CIR.zCreated := formatdatetime('yyyy/mm/dd', Now);
  CIR.z01 := '';
  CIR.z02 := '';
  CIR.z03 := '';
  CIR.z04 := '';
  CIR.z05 := '';
  CIR.z06 := '';
  CIR.z07 := '';
  CIR.z08 := '';
  CIR.z09 := '';
  CIR.z10 := '';
  CIR.z11 := '';
  CIR.o01 := '';
  CIR.o02 := '';
  CIR.o03 := '';
  CIR.zType := '';

  if rgBookAuth.IsChecked then
  begin
    CIR.zType := 'BK:AUTH';
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Publication';
    eb04.TextPrompt := 'Edition';
    eb05.TextPrompt := 'Place of Publication';
    eb06.TextPrompt := 'Publisher Name';
    eb07.TextPrompt := 'Edited by: Init. Surname';
    eb08.TextPrompt := 'Volumes: (x Volumes)';
    eb09.TextPrompt := 'Page: p. X|pp. X-Y';
    eb10.TextPrompt := ' ';
    eb11.TextPrompt := ' ';
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgBookNoAuth.IsChecked then
  begin
    CIR.zType := 'BK:NOAUTH';
    eb01.TextPrompt := 'Title of Publication';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Edition';
    eb04.TextPrompt := 'Place of Publication';
    eb05.TextPrompt := 'Publisher Name';
    eb06.TextPrompt := 'Edited by: Init. Surname';
    eb07.TextPrompt := 'Volumes: (x Volumes)';
    eb08.TextPrompt := 'Page: p. X|pp. X-Y';
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgBookOrgAuth.IsChecked then
  begin
    CIR.zType := 'BK:ORG';
    eb01.TextPrompt := 'Organisation Name';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Publication';
    eb04.TextPrompt := 'Edition';
    eb05.TextPrompt := 'Place of Publication';
    eb06.TextPrompt := 'Publisher Name';
    eb07.TextPrompt := 'Edited by: Init. Surname';
    eb08.TextPrompt := 'Volumes: (x Volumes)';
    eb09.TextPrompt := 'Page: p. X|pp. X-Y';
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgBookReprint.IsChecked then
  begin
    CIR.zType := 'BK:REPR';
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Original';
    eb03.TextPrompt := 'Title of Publication';
    eb04.TextPrompt := 'Edition Reprinted';
    eb05.TextPrompt := 'Place of Publication';
    eb06.TextPrompt := 'Publisher Name';
    eb07.TextPrompt := 'Year of reprint';
    eb08.TextPrompt := ' ';
    eb09.TextPrompt := ' ';
    eb10.TextPrompt := ' ';
    eb11.TextPrompt := ' ';
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgBookFacsimile.IsChecked then
  begin
    CIR.zType := 'BK:FACS';
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Publication';
    eb04.TextPrompt := 'Edition Copied';
    eb05.TextPrompt := 'Place of Publication';
    eb06.TextPrompt := 'Publisher Name';
    eb07.TextPrompt := 'Year of Facsimile';
    eb08.TextPrompt := ' ';
    eb09.TextPrompt := ' ';
    eb10.TextPrompt := ' ';
    eb11.TextPrompt := ' ';
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgAnthology.IsChecked then
  begin
    CIR.zType := 'BK:ANTH';
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Role';
    eb03.TextPrompt := 'Year of Publication';
    eb04.TextPrompt := 'Title of Publication';
    eb05.TextPrompt := 'Edition';
    eb06.TextPrompt := 'Place of Publication';
    eb07.TextPrompt := 'Publisher Name';
    eb08.TextPrompt := 'Page: p. X|pp. X-Y';
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgAnthologyLine.IsChecked then
  begin
    CIR.zType := 'BK:ANLN';
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Poem/Art';
    eb04.TextPrompt := 'Surname, Init.';
    eb05.TextPrompt := 'Role';
    eb06.TextPrompt := 'Title of Publication';
    eb07.TextPrompt := 'Place of Publication';
    eb08.TextPrompt := 'Publisher Name';
    eb09.TextPrompt := 'Page: p. X|pp. X-Y';
//    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgReference.IsChecked then
  begin
    CIR.zType := 'BK:REF';
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Article Title';
    eb04.TextPrompt := 'Editors: Init. Surname';
    eb05.TextPrompt := 'Publication Title';
    eb06.TextPrompt := 'Edition';
    eb07.TextPrompt := 'Place of Publication';
    eb08.TextPrompt := 'Publisher Name';
    eb09.TextPrompt := 'Page: p. X|pp. X-Y';
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgBible.IsChecked then
  begin
    CIR.zType := 'BK:BIBL';
    eb01.TextPrompt := 'Publication Title';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Optional: Translator Edition';
    eb04.TextPrompt := 'Place of Publication';
    eb05.TextPrompt := 'Publisher Name';
    eb06.TextPrompt := 'Page: p. X|pp. X-Y|Ref';
    eb07.TextPrompt := 'Bible Short Code';
    eb08.TextPrompt := ' ';
    eb09.TextPrompt := ' ';
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgBookCollected.IsChecked then
  begin
    CIR.zType := 'BK:COLL';
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Publication';
    eb04.TextPrompt := 'Edition';
    eb05.TextPrompt := 'Volumes';
    eb06.TextPrompt := 'Place of Publication';
    eb07.TextPrompt := 'Publisher Name';
    eb08.TextPrompt := 'Page: p. X|pp. X-Y';
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgBookChap.IsChecked then
  begin
    CIR.zType := 'BK:CHAP';
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Chapter';
    eb04.TextPrompt := 'Editors';
    eb05.TextPrompt := 'Title of Publication';
    eb06.TextPrompt := 'Place of Publication';
    eb07.TextPrompt := 'Publisher Name';
    eb08.TextPrompt := 'Page: p. X|pp. X-Y';
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

    if rgBookPartChap.IsChecked then
  begin
    CIR.zType := 'BK:CHPT';
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Chapter';
    eb04.TextPrompt := 'Editors';
    eb05.TextPrompt := 'Title of Publication';
    eb06.TextPrompt := 'Place of Publication';
    eb07.TextPrompt := 'Publisher Name';
    eb08.TextPrompt := 'Extract: Page: p. X|pp. X-Y';
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgJournalArt.IsChecked then
  begin
    CIR.zType := 'JN:ART';
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Article';
    eb04.TextPrompt := 'Title of Publication';
    eb05.TextPrompt := 'Volume(Part)';
    eb06.TextPrompt := 'Page: p. X|pp. X-Y';
    eb07.Enabled := false;
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgJournalWhole.IsChecked then
  begin
    CIR.zType := 'JN:FULL';
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Role';
    eb03.TextPrompt := 'Year of Publication';
    eb04.TextPrompt := 'Title of Article';
    eb05.TextPrompt := 'Title of Publication';
    eb06.TextPrompt := 'Volume(Part)';
    eb07.Enabled := false;
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgWebAuth.IsChecked then
  begin
    CIR.zType := 'WW:AUTH';
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Page';
    eb04.Enabled := false;
    eb05.Enabled := false;
    eb06.Enabled := false;
    eb07.Enabled := false;
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgWebOrg.IsChecked then
  begin
    CIR.zType := 'WW:ORG';
    eb01.TextPrompt := 'Organisation.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Page';
    eb04.Enabled := false;
    eb05.Enabled := false;
    eb06.Enabled := false;
    eb07.Enabled := false;
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgWebNoAuth.IsChecked then
  begin
    CIR.zType := 'WW:NONE';
    eb01.TextPrompt := 'Title of Page';
    eb02.TextPrompt := 'Year of Publication';
    eb03.Enabled := false;
    eb04.Enabled := false;
    eb05.Enabled := false;
    eb06.Enabled := false;
    eb07.Enabled := false;
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgSocialMedia.IsChecked then
  begin
    eb02.Text := formatdatetime('yyyy', Now);
    eb05.Text := formatdatetime('dd mmmm', Now);
    CIR.zType := 'SM:ALL';
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Article';
    eb04.TextPrompt := 'Platform/APP';
    eb05.TextPrompt := 'Day Month';
    eb06.Enabled := false;
    eb07.Enabled := false;
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgNewsByline.IsChecked then
  begin
    eb02.Text := formatdatetime('yyyy', Now);
    eb06.Text := formatdatetime('dd mmmm', Now);
    CIR.zType := 'NW:BYLN';
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Article';
    eb04.TextPrompt := 'Newspaper';
    eb05.TextPrompt := 'Edition';
    eb06.TextPrompt := 'Day Month';
    eb07.TextPrompt := 'Page: p. X|pp. X-Y';
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgNewsNoByline.IsChecked then
  begin
    eb02.Text := formatdatetime('yyyy', Now);
    eb05.Text := formatdatetime('dd mmmm', Now);
    CIR.zType := 'NW:NOBY';
    eb01.TextPrompt := 'Newspaper';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Article';
    eb04.TextPrompt := 'Edition';
    eb05.TextPrompt := 'Day Month';
    eb06.TextPrompt := 'Page: p. X|pp. X-Y';
    eb07.Enabled := false;
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgPainting.IsChecked then
  begin
    eb06.Text := formatdatetime('dd mmmm yyyy', Now);
    CIR.zType := 'AR:PNTG';
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Work';
    eb04.TextPrompt := 'Media used';
    eb05.TextPrompt := 'Location';
    eb06.TextPrompt := 'Date Viewed';
    eb07.Enabled := false;
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgPhotographicPrint.IsChecked then
  begin
    //  	eb06.text := formatdatetime('dd mmmm yyyy', Now);
    CIR.zType := 'AR:PHBK';
    eb01.TextPrompt := 'Photographer: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Work';
    eb04.TextPrompt := 'Media used';
    eb05.TextPrompt := 'Place of Publication';
    eb06.TextPrompt := 'Publisher Name';
    eb07.Enabled := false;
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgPhotographWeb.IsChecked then
  begin
    //  	eb06.text := formatdatetime('dd mmmm yyyy', Now);
    CIR.zType := 'AR:PHWW';
    eb01.TextPrompt := 'Photographer: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Work';
    eb04.Enabled := false;
    eb05.Enabled := false;
    eb06.Enabled := false;
    eb07.Enabled := false;
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
//    cbOnline.IsChecked := True;
  end;

  if rgPodcast.IsChecked then
  begin
    //  	eb06.text := formatdatetime('dd mmmm yyyy', Now);
    CIR.zType := 'AV:PODC';
    eb02.Text := formatdatetime('yyyy', Now);
    eb05.Text := formatdatetime('dd mmmm', Now);
    eb01.TextPrompt := 'Host: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Podcast';
    eb04.TextPrompt := 'Media used';
    eb05.TextPrompt := 'Day Month';
    eb06.TextPrompt := 'Place of Publication';
    eb07.TextPrompt := 'Publisher Name';
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgRadio.IsChecked then
  begin
    eb02.Text := formatdatetime('yyyy', Now);
    eb04.Text := formatdatetime('dd mmmm', Now);
    CIR.zType := 'AV:RDIO';
    eb01.TextPrompt := 'Title of Show';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Broadcaster';
    eb04.TextPrompt := 'Day Month';
    eb05.Enabled := false;
    eb06.Enabled := false;
    eb07.Enabled := false;
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgTVSingle.IsChecked then
  begin
    eb02.Text := formatdatetime('yyyy', Now);
//    cbOnline.IsChecked := True;
    eb04.Text := formatdatetime('dd mmmm', Now);
    CIR.zType := 'AV:TV';
    eb01.TextPrompt := 'Title of Show';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Broadcaster';
    eb04.TextPrompt := 'Day Month';
    eb05.Enabled := false;
    eb06.Enabled := false;
    eb07.Enabled := false;
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgTVEpisodeSeries.IsChecked then
  begin
//    cbOnline.IsChecked := True;
    eb06.Text := formatdatetime('dd mmmm', Now);
    CIR.zType := 'AV:TVSE';
    eb01.TextPrompt := 'Title of Episode';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Show';
    eb04.TextPrompt := 'Series(Episode#)';
    eb05.TextPrompt := 'Broadcaster';
    eb06.TextPrompt := 'Day Month';
    eb07.Enabled := false;
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgMovies.IsChecked then
  begin
    //    cbOnline.IsChecked:=true;
    //  	eb06.text := formatdatetime('dd mmmm', Now);
    CIR.zType := 'AV:MOVI';
    eb01.TextPrompt := 'Title of Movie';
    eb02.TextPrompt := 'Year of Production';
    eb03.TextPrompt := 'Director';
    eb04.TextPrompt := 'Format [DVD/STREAM/CINEMA]';
    eb05.TextPrompt := 'Place of Publication';
    eb06.TextPrompt := 'Publisher Name';
    eb07.TextPrompt := 'Reissue Year';
    eb08.TextPrompt := 'Reprint Year';
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgVLELectureNotes.IsChecked then
  begin
//    cbOnline.IsChecked := True;
    //  	eb06.text := formatdatetime('dd mmmm', Now);
    CIR.zType := 'VL:NTES';
    eb01.TextPrompt := 'Author/Tutor';
    eb02.TextPrompt := 'Year of Production';
    eb03.TextPrompt := 'Title of Item';
    eb04.TextPrompt := 'Module Code: Title';
    eb05.TextPrompt := 'Place of Publication';
    eb06.TextPrompt := 'Institution Name';
    eb06.Enabled := false;
    eb07.Enabled := false;
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgVLETutorHandout.IsChecked then
  begin
//    cbOnline.IsChecked := True;
    eb06.Text := 'Unpublished';
    CIR.zType := 'VL:HAND';
    eb01.TextPrompt := 'Author/Tutor';
    eb02.TextPrompt := 'Year of Production';
    eb03.TextPrompt := 'Title of Handout';
    eb04.TextPrompt := 'Module Code: Title';
    eb05.TextPrompt := 'Institution Name';
    eb06.TextPrompt := 'Published';
    eb07.Enabled := false;
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

  if rgConfPaper.IsChecked then
  begin
    CIR.zType := 'CF:PAPR';
  //	//  Surname, Initial.
  //	//  Year of publication (in round brackets)
  //	//  Title of paper (in single quotation marks)
  //	//  Title of conference (in italics)
  //	//  Organisation or company (if stated)
  //	//  Location and date of conference
  //	//  Available at: DOI or URL (Accessed: date)
    eb01.TextPrompt := 'Author/Speaker';
    eb02.TextPrompt := 'Year of Presentation';
    eb03.TextPrompt := 'Title of Paper';
    eb04.TextPrompt := 'Title of Conference';
    eb05.TextPrompt := 'Org/Company';
    eb06.TextPrompt := 'Module Code: Title';
    eb07.TextPrompt := 'Locn and Date of Conference';
    eb08.Enabled := false;
    eb09.Enabled := false;
    eb10.Enabled := false;
    eb11.Enabled := false;
  end;

//  EBOL03.Text := formatdatetime('dd mmmm yyyy', Now);
  EBOL01.TextPrompt := 'www/doi/location';
  EBOL02.TextPrompt := 'last updated';
  EBOL03.TextPrompt := 'Accessed';
  EBOL01.Enabled := True;
  EBOL02.Enabled := True;
  EBOL03.Enabled := True;
  Button3.Enabled := True;
end;

procedure TForm3.bFirstClick(Sender: TObject);
begin
  if TPrj.Active=false then TPrj.Active:=true;
  TPrj.First;
  Label7.Text:=IntToStr(TPrj.RecNo)+'/'+IntToStr(TPrj.RecordCount);
end;

procedure TForm3.bLastClick(Sender: TObject);
begin
  if TPrj.Active=false then TPrj.Active:=true;
  TPrj.Last;
  Label7.Text:=IntToStr(TPrj.RecNo)+'/'+IntToStr(TPrj.RecordCount);
end;

procedure TForm3.bNextClick(Sender: TObject);
begin
  if TPrj.Active=false then TPrj.Active:=true;
  TPrj.Next;
  Label7.Text:=IntToStr(TPrj.RecNo)+'/'+IntToStr(TPrj.RecordCount);
end;

procedure TForm3.bPrevClick(Sender: TObject);
begin
  if TPrj.Active=false then TPrj.Active:=true;
  TPrj.Prior;
  Label7.Text:=IntToStr(TPrj.RecNo)+'/'+IntToStr(TPrj.RecordCount);
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  CIR.zProject := ebProject.Text;
  CIR.zProject := ebProject.Text;
  CIR.zModule := ebModule.Text;
  CIR.zSubject := ebSubject.Text;
  CIR.zCreated := formatdatetime('yyyy/mm/dd', Now);
  if cbBibliogOnly.IsChecked = True then
    CIR.zBibOnly := 'BIBLIOGRAPHY'
  else
    CIR.zBibOnly := 'CITATION';
  CIR.z01 := eb01.Text;
  CIR.z02 := eb02.Text;
  CIR.z03 := eb03.Text;
  CIR.z04 := eb04.Text;
  CIR.z05 := eb05.Text;
  CIR.z06 := eb06.Text;
  CIR.z07 := eb07.Text;
  CIR.z08 := eb08.Text;
  CIR.z09 := eb09.Text;
  CIR.z10 := eb10.Text;
  CIR.z11 := eb11.Text;
  CIR.o01 := EBOL01.Text;
  CIR.o02 := EBOL02.Text;
  CIR.o03 := EBOL03.Text;
  //    CIR.zCiteInline: string;
  //    CIR.zCiteInline2: string;
  //    CIR.zCiteHarvard: string;
  BuildCIR(CIR.zType);
  TabControl2.ActiveTab:=TabItem6;
  end;

procedure TForm3.BuildCIR(st: string);
var
  il1, il2, ref: string;
begin
  il1 := '';
  il2 := '';
  ref := '';
  //
  //
  //
  if rgBookAuth.IsChecked then
  begin
    // inline
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    if eb09.Text > ' ' then
      if Pos('-', eb09.Text) > 0 then
        il1 := il1 + ', pp. ' + eb09.Text
      else
        il1 := il1 + ', p. ' + eb09.Text;
    il1 := il1 + ')';
    // citation
    ref := eb01.Text + ' (' + eb02.Text + ') <i>' + eb03.Text + '</i>';
    if eb04.Text > ' ' then
      ref := ref + ' ' + eb04.Text + ' edn. ';
    ref := ref + ' ' + eb05.Text + ': ' + eb06.Text;
    if eb07.Text > ' ' then
      ref := ref + ' Edited by ' + eb07.Text;
    if eb08.Text > ' ' then
      ref := ref + ' (' + eb08.Text + ' Vols)';
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text + '.)';
  end;
  //
  if rgBookNoAuth.IsChecked then
  begin
    //Book no Author
    //  Title of book. Edition.
    //  (Year of publication)
    //  Translator and edition, if required (in round brackets)
    //  Place of publication: Publisher.
    //  Series and volume number if relevant.
    //  Available at: DOI or URL
    //  (Accessed: dd month yyyy)
    il1 := '(' + '<i>'+eb01.Text+'</i>' + ' ' + eb02.Text;
    if eb08.Text > ' ' then
      if Pos('-', eb08.Text) > 0 then
        il1 := il1 + ', pp. ' + eb08.Text
      else
        il1 := il1 + ', p. ' + eb08.Text;
    il1 := il1 + ')';
    // citation
    ref := '<i>'+eb01.Text+'</i>';
    if eb03.Text >' ' then
      ref:= ref + ' '+eb03.Text;
    ref := ref + ' ('+eb02.Text+')';
    ref:= ref + ' '+eb04.Text+': '+eb05.Text;
    if eb06.Text >' ' then
      ref:= ref + 'Edited by: '+eb06.Text;
    if eb07.Text >' ' then
      ref:= ref + ' ('+eb07.Text+' vols)';
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgBookReprint.IsChecked then
  begin
    //Book reprint
  	//  Surname, Initial.
  	//  (Year of publication)
  	//  Title of book.
  	//  Place of reprint publication: publisher, Year of facsimile.
    il1 := '(' + eb01.Text + ' ' + eb02.Text + ')';
    // citation
    ref := eb01.Text;
    ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' <i>'+eb03.Text+'</i>';
    if eb04.Text >' ' then
    ref:= ref + ' Reprint of the '+eb04.Text+' edn. ';
    ref:= ref + ' '+eb05.Text+': '+eb06.Text+', '+eb07.Text;
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgBookFacsimile.IsChecked then
  begin
    //Book Facsimile
  	//  Surname, Initial.
  	//  (Year of publication)
  	//  Title of book.
  	//  Reprint of the ... edn.
  	//  Place of facsimile publication: publisher, Year of facsimile.
    il1 := '(' + eb01.Text + ' ' + eb02.Text + ')';
    // citation
    ref := eb01.Text;
    ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' <i>'+eb03.Text+'</i>';
    if eb04.Text >' ' then
    ref:= ref + ' Facsimile of the '+eb04.Text+' edn. ';
    ref:= ref + ' '+eb05.Text+': '+eb06.Text+', '+eb07.Text;
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

 if rgBookOrgAuth.IsChecked then
  begin
    // inline
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    if eb09.Text > ' ' then
      if Pos('-', eb09.Text) > 0 then
        il1 := il1 + ', pp. ' + eb09.Text
      else
        il1 := il1 + ', p. ' + eb09.Text;
    il1 := il1 + ')';
    // citation
    ref := eb01.Text + ' (' + eb02.Text + ') <i>' + eb03.Text + '</i> ';
    if eb04.Text > ' ' then
      ref := ref + eb04.Text + ' edn.';
    ref := ref + ' ' + eb05.Text + ': ' + eb06.Text;
    if eb07.Text > ' ' then
      ref := ref + ' Edited by ' + eb07.Text;
    if eb08.Text > ' ' then
      ref := ref + ' (' + eb08.Text + ' vols.)';
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;



  if rgAnthology.IsChecked then
  begin
//    CIR.zType := 'BK:ANTH';
//    eb01.TextPrompt := 'Author: Surname, Init.';
//    eb02.TextPrompt := 'Role';
//    eb03.TextPrompt := 'Year of Publication';
//    eb04.TextPrompt := 'Title of Publication';
//    eb05.TextPrompt := 'Edition';
//    eb06.TextPrompt := 'Place of Publication';
//    eb07.TextPrompt := 'Publisher Name';
//    eb08.TextPrompt := 'Page: p. X|pp. X-Y';
//    eb09.Enabled := false;
//    eb10.Enabled := false;
//    eb11.Enabled := false;
    // inline
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    if eb08.Text > ' ' then
      if Pos('-', eb08.Text) > 0 then
        il1 := il1 + ', pp. ' + eb08.Text
      else
        il1 := il1 + ', p. ' + eb08.Text;
    il1 := il1 + ')';

    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
    ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' ('+eb03.Text+')';
    ref := ref + ' '+eb04.Text;
    if eb05.Text >' ' then
    ref:= ref + ' '+eb05.Text;
    ref:= ref + ' '+eb06.Text+': '+eb07.Text;
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';

  end;

  if rgAnthologyLine.IsChecked then
  begin
//    CIR.zType := 'BK:ANLN';
//    eb01.TextPrompt := 'Author: Surname, Init.';
//    eb02.TextPrompt := 'Year of Publication';
//    eb03.TextPrompt := 'Title of Poem/Art';
//    eb04.TextPrompt := 'Editor: Init. Surname';
//    eb05.TextPrompt := 'Title of Publication';
//    eb06.TextPrompt := 'Place of Publication';
//    eb07.TextPrompt := 'Publisher Name';
//    eb08.TextPrompt := 'Page: p. X|pp. X-Y';
//    eb09.Enabled := false;
//    eb10.Enabled := false;
//    eb11.Enabled := false;
    // inline
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    if eb09.Text > ' ' then
      if Pos('-', eb09.Text) > 0 then
        il1 := il1 + ', pp. ' + eb09.Text
      else
        il1 := il1 + ', p. ' + eb09.Text;
    il1 := il1 + ')';

    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' <qs>'+eb03.Text+'</qs>';
    if eb04.Text >' ' then
    ref:= ref + ', in '+eb04.Text;
    if eb05.Text >' ' then
    ref:= ref + ' ('+eb05.Text+')';
    if eb05.Text >' ' then
    ref:= ref + ' <i>'+eb06.Text+'</i>';
    ref:= ref + ' '+eb07.Text+': '+eb08.Text;
//    if eb09.Text > ' ' then
//      if Pos('-', eb09.Text) > 0 then
//        ref := ref + ', pp. ' + eb09.Text
//      else
//        ref := ref + ', p. ' + eb09.Text;
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgReference.IsChecked then
  begin
    CIR.zType := 'BK:REF';
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Article Title';
    eb04.TextPrompt := 'Editors: Init. Surname';
    eb05.TextPrompt := 'Publication Title';
    eb06.TextPrompt := 'Edition';
    eb07.TextPrompt := 'Place of Publication';
    eb08.TextPrompt := 'Publisher Name';
    eb09.TextPrompt := 'Page: p. X|pp. X-Y';
    eb09.TextPrompt := ' ';
    eb10.Enabled := false;
    eb11.Enabled := false;
    // inline
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    if eb09.Text > ' ' then
      if Pos('-', eb09.Text) > 0 then
        il1 := il1 + ', pp. ' + eb09.Text
      else
        il1 := il1 + ', p. ' + eb09.Text;
    il1 := il1 + ')';

    // citation
    if eb01.Text>'' then
    begin
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' <qs>'+eb03.Text + '</qs>'
    end else
    begin     //no chapter/sect usthor
    ref := ref + ' <qs>'+eb03.Text + '</qs>';
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    end;
    if eb04.Text >' ' then
    ref:= ref + ' in '+eb04.Text+' (eds.)';
    if eb05.Text >' ' then
    ref:= ref + ' <i>'+eb05.Text+'</i>';
    if eb06.Text >' ' then
    ref:= ref + ' '+eb06.Text+' edn.';
    ref:= ref + ' '+eb07.Text+': '+eb08.Text;
    if eb09.Text > ' ' then
      if Pos('-', eb09.Text) > 0 then
        ref := ref + ', pp. ' + eb09.Text+'.'
      else
        ref := ref + ', p. ' + eb09.Text+'.';
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgBible.IsChecked then
  begin
  //	//  Title (not in italics)
  //	//  Year of publication (in round brackets)
  //	//  Translator and edition, if required (in round brackets)
  //	//
  //	//  Place of publication: publisher
  //	//  or
  //	//  Available at: DOI or URL (Accessed: date)
    CIR.zType := 'BK:BIBL';
    eb01.TextPrompt := 'Publication Title';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Optional: Translator Edition';
    eb04.TextPrompt := 'Place of Publication';
    eb05.TextPrompt := 'Publisher Name';
    eb06.TextPrompt := 'Page: p. X|pp. X-Y|Ref';
    // inline
    il1 :=eb06.Text+' ['+eb07.Text+'] ('+eb01.Text + ', '+ eb02.Text;
//    if eb06.Text >' ' then
//    il1 := il1 + ', '+ eb06.Text+'(
    il1 := il1 + ')';

    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    if eb03.Text >' ' then
    ref := ref + ' '+eb03.Text;
    ref:= ref + ' '+eb04.Text+': '+eb05.Text;
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgWebAuth.IsChecked then
  begin
  //				//Webpage (with Author)
  //				//  Surname, Initial. or Organisation
  //				//  Year that the site was published/last updated (in round brackets)
  //				//  Title of web page or website (in italics)
  //				//  Available at: URL (Accessed: date)
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Page';
  // inline
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    il1 := il1 + ')';

    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' <i>'+eb03.Text+'</i>';
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgWebOrg.IsChecked then
  begin
  //				//Webpage (org)
  //				//  Organisation
  //				//  Year that the site was published/last updated (in round brackets)
  //				//  Title of web page or website (in italics)
  //				//  Available at: URL (Accessed: date)
    eb01.TextPrompt := 'Organisation.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Page';
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    il1 := il1 + ')';

    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' <i>'+eb03.Text+'</i>';
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgWebNoAuth.IsChecked then
  begin
  //				//Webpage (no Author)
  //				//  Title of web page or website (in italics)
  //				//  Year that the site was published/last updated (in round brackets)
  //				//  Available at: URL (Accessed: date)
    eb01.TextPrompt := 'Title of Page';
    eb02.TextPrompt := 'Year of Publication';
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    il1 := il1 + ')';

    // citation
    ref := '<i>'+eb01.Text+'</i>';
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgSocialMedia.IsChecked then
  begin
  //	//  Author of post
  //	//  Year posted (in round brackets)
  //	//  Title or description of post (in single quotation marks)
  //	//  [Name of platform]
  //	//  Day/month posted
  //	//  Available at: URL (Accessed: date)
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Article';
    eb04.TextPrompt := 'Platform/APP';
    eb05.TextPrompt := 'Day Month';
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    il1 := il1 + ')';

    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' <qs>'+eb03.Text + '<qs>';
    if eb04.Text >' ' then
      ref := ref + ' ['+eb04.Text+']';
    if eb05.Text >' ' then
      ref := ref + ' '+eb05.Text;
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgNewsByline.IsChecked then
  begin
  //				//Newspaper (byline)
  //				//  Author
  //				//  Year of publication (in round brackets)
  //				//  Title of article|letter (in single quotation marks)
  //				//  Title of newspaper (in italics – capitalise first letter of each word in title, except for linking  words such as and, of, the, for)
  //				//  Edition if required (in round brackets) also use for regional
  //				//  Day and month
  //				//  Section and page reference (if available)
  //				//  Available at: DOI or URL (Accessed: date)
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Article';
    eb04.TextPrompt := 'Newspaper';
    eb05.TextPrompt := 'Edition';
    eb06.TextPrompt := 'Day Month';
    eb07.TextPrompt := 'Page: p. X|pp. X-Y';
    // inline
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    if eb07.Text > ' ' then
      if Pos('-', eb07.Text) > 0 then
        il1 := il1 + ', pp. ' + eb07.Text
      else
        il1 := il1 + ', p. ' + eb07.Text;
    il1 := il1 + ')';

    // citation
    ref := eb01.Text;
    ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' <qs>'+eb03.Text+'<qs>';
    ref := ref + ' <i>'+eb04.Text+'</i>';
    if eb05.Text >' ' then
    ref:= ref + ' ('+eb05.Text+')';
    ref:= ref + ' '+eb06.Text;
    if eb07.Text > ' ' then
      if Pos('-', eb07.Text) > 0 then
        il1 := il1 + ' pp. ' + eb07.Text
      else
        il1 := il1 + ' p. ' + eb07.Text;

    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';

  end;

  if rgNewsNoByline.IsChecked then
  begin
  //				//Newspaper (no byline)
  //				//=====================
  //				//  Title of newspaper (in italics – capitalise first letter of each word in title, except for linking  words such as and, of, the, for)
  //				//  Year of publication (in round brackets)
  //				//  Title of article (in single quotation marks)
  //				//  Edition if required (in round brackets)
  //				//  Day and month
  //				//  Section and page reference (if available)
  //				//  Available at: DOI or URL (Accessed: date)
    eb01.TextPrompt := 'Newspaper';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Article';
    eb04.TextPrompt := 'Edition';
    eb05.TextPrompt := 'Day Month';
    eb06.TextPrompt := 'Page: p. X|pp. X-Y';
    // inline
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    if eb06.Text > ' ' then
      if Pos('-', eb06.Text) > 0 then
        il1 := il1 + ', pp. ' + eb06.Text
      else
        il1 := il1 + ', p. ' + eb06.Text;
    il1 := il1 + ')';

    // citation
    ref := '<i>'+eb01.Text+'</i>';
    ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' <qs>'+eb03.Text+'<qs>';
    if eb04.Text >' ' then
    ref:= ref + ' ('+eb04.Text+')';
    ref:= ref + ' '+eb05.Text;
    if eb06.Text > ' ' then
      if Pos('-', eb06.Text) > 0 then
        ref := ref + ' pp. ' + eb06.Text
      else
        ref := ref + ' p. ' + eb06.Text;

    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+')';
  end;


  //
  // to finish
  //



  if rgJournalArt.IsChecked then
  begin
    //  Author (surname followed by initials)
    //  Year of publication (in round brackets)
    //  Title of article (in single quotation marks)
  	//  Title of journal (in italics – capitalise first letter of each word in title, except for linking words such as and, of, the, for)
  	//  Issue information: volume (unbracketed) and, where applicable, part number, month or season (all in round brackets)
  	//  Page reference (if available) or article number
  	//   ##[ONLINE]##
  	//  Available at: DOI or URL (if required) (Accessed: date)
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Article';
    eb04.TextPrompt := 'Title of Publication';
    eb05.TextPrompt := 'Volume(Part)';
    eb06.TextPrompt := 'Page: p. X|pp. X-Y';
   //
      il1 := '(' + eb01.Text + ', ' + eb02.Text;
    if eb06.Text > ' ' then
      if Pos('-', eb06.Text) > 0 then
        il1 := il1 + ', pp. ' + eb06.Text
      else
        il1 := il1 + ', p. ' + eb06.Text;
    il1 := il1 + ')';

    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' <qs>'+eb03.Text+'<qs>';
    ref := ref + ', <i>'+eb04.Text+'</i>';
    if eb05.Text >' ' then
    ref:= ref + ', '+eb05.Text;
    if eb06.Text > ' ' then
      if Pos('-', eb06.Text) > 0 then
        ref := ref + ', pp. ' + eb06.Text+'.'
      else
        ref := ref + ', p. ' + eb06.Text+'.';
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;


  if rgJournalWhole.IsChecked then
  begin
   	//  Author (surname followed by initials)
  	//  Year of publication (in round brackets)
  	//  Title of article (in single quotation marks)
  	//  Title of journal (in italics – capitalise first letter of each word in title, except for linking words such as and, of, the, for)
  	//  Issue information: volume (unbracketed) and, where applicable, part number, month or season (all in round brackets)
  	//  ##[ONLINE]##
  	//  Available at: DOI or URL (if required) (Accessed: date)
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Role';
    eb03.TextPrompt := 'Year of Publication';
    eb04.TextPrompt := 'Title of Article';
    eb05.TextPrompt := 'Title of Publication';
    eb06.TextPrompt := 'Volume(Part)';
 //
      il1 := '(' + eb01.Text + ', ' + eb02.Text;
//    if eb06.Text > ' ' then
//      if Pos('-', eb06.Text) > 0 then
//        il1 := il1 + ', pp. ' + eb06.Text
//      else
//        il1 := il1 + ', p. ' + eb06.Text;
    il1 := il1 + ')';

    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+'.)';
    if eb03.Text >' ' then
      ref := ref + ' ('+eb03.Text+')';
    ref := ref + ' <qs>'+eb04.Text+'<qs>';
    ref := ref + ', <i>'+eb05.Text+'</i>';
    if eb06.Text >' ' then
    ref:= ref + ', '+eb06.Text;
    ref:= ref+'.';
//    if eb06.Text > ' ' then
//      if Pos('-', eb06.Text) > 0 then
//        ref := ref + ', pp. ' + eb06.Text
//      else
//        ref := ref + ', p. ' + eb06.Text;
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + '( Accessed: ' + EBOL03.Text+')';
  end;

  if rgVLELectureNotes.IsChecked then
  begin
  //				//VLE Tutor lecture notes
  //				//  Author or tutor
  //				//  Year of publication (in round brackets)
  //				//  Title of item (in single quotation marks)
  //				//  Module code: module title (in italics)
  //				//  Available at: URL of VLE (Accessed: date)
    eb01.TextPrompt := 'Author/Tutor';
    eb02.TextPrompt := 'Year of Production';
    eb03.TextPrompt := 'Title of Item';
    eb04.TextPrompt := 'Module Code: Title';
    eb05.TextPrompt := 'Place of Publication';
    eb06.TextPrompt := 'Institution Name';
 //
      il1 := '(' + eb01.Text + ', ' + eb02.Text;
//    if eb06.Text > ' ' then
//      if Pos('-', eb06.Text) > 0 then
//        il1 := il1 + ', pp. ' + eb06.Text
//      else
//        il1 := il1 + ', p. ' + eb06.Text;
    il1 := il1 + ')';

    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' <qs>'+eb03.Text+ '<qs>.';
    ref := ref + ' <i>'+eb04.Text+ '</i>.';
    if eb05.Text >' ' then
    ref:= ref + ' '+eb05.Text+ '.';
    if eb06.Text > ' ' then
    ref:= ref + ' '+eb06.Text+ '.';
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgVLETutorHandout.IsChecked then
  begin
  //				//Tutor Handout
  //				//  Tutor
  //				//  Year of distribution (in round brackets)
  //				//  Title of handout (in single quotation marks)
  //				//  Module code: module title (in italics)
  //				//  Institution
  //				//  Unpublished
    eb01.TextPrompt := 'Author/Tutor';
    eb02.TextPrompt := 'Year of Production';
    eb03.TextPrompt := 'Title of Handout';
    eb04.TextPrompt := 'Module Code: Title';
    eb05.TextPrompt := 'Institution Name';
    eb06.TextPrompt := 'Published';
    eb06.Text := 'Unpublished';
    //
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    il1 := il1 + ')';
    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' <qs>'+eb03.Text+'<qs>.';
    ref := ref + ' <i>'+eb04.Text+'</i>.';
    if eb05.Text >' ' then
    ref:= ref + ' '+eb05.Text+'.';
    if eb06.Text > ' ' then
    ref:= ref + ' '+eb06.Text+'.';
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgPainting.IsChecked then
  begin
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Work';
    eb04.TextPrompt := 'Media used';
    eb05.TextPrompt := 'Location';
    eb06.TextPrompt := 'Date Viewed';
    //
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    il1 := il1 + ')';
    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' '+eb03.Text;
    ref := ref + ' ['+eb04.Text+']';
    if eb05.Text >' ' then
    ref:= ref + ' '+eb05.Text;
    if eb06.Text > ' ' then
    ref:= ref + ' '+eb06.Text;
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgPhotographicPrint.IsChecked then
  begin
    eb01.TextPrompt := 'Photographer: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Work';
    eb04.TextPrompt := 'Media used';
    eb05.TextPrompt := 'Place of Publication';
    eb06.TextPrompt := 'Publisher Name';
    //
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    il1 := il1 + ')';
    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' '+eb03.Text;
    ref := ref + ' ['+eb04.Text+']';
    if eb05.Text >' ' then
    ref:= ref + ' '+eb05.Text;
    if eb06.Text > ' ' then
    ref:= ref + ': '+eb06.Text;
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgPhotographWeb.IsChecked then
  begin
    eb01.TextPrompt := 'Photographer: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Work';
    //
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    il1 := il1 + ')';
    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' '+eb03.Text;
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgPodcast.IsChecked then
  begin
    eb01.TextPrompt := 'Host: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Podcast';
    eb04.TextPrompt := 'Media used';
    eb05.TextPrompt := 'Day Month';
    eb06.TextPrompt := 'Place of Publication';
    eb07.TextPrompt := 'Publisher Name';
    //
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    il1 := il1 + ')';
    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' '+eb03.Text;
    ref := ref + ' ['+eb04.Text+']';
    if eb05.Text >' ' then
    ref:= ref + ' '+eb05.Text;
    if eb06.Text >' ' then
    ref:= ref + ' '+eb06.Text;
    if eb07.Text > ' ' then
    ref:= ref + ': '+eb07.Text;
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgRadio.IsChecked then
  begin
    eb01.TextPrompt := 'Title of Show';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Broadcaster';
    eb04.TextPrompt := 'Day Month';
    //
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    il1 := il1 + ')';
    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' '+eb03.Text;
    ref := ref + ' '+eb04.Text;
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgTVSingle.IsChecked then
  begin
    eb01.TextPrompt := 'Title of Show';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Broadcaster';
    eb04.TextPrompt := 'Day Month';
    //
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    il1 := il1 + ')';
    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' '+eb03.Text;
    ref := ref + ' '+eb04.Text;
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgTVEpisodeSeries.IsChecked then
  begin
    eb01.TextPrompt := 'Title of Episode';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Show';
    eb04.TextPrompt := 'Series(Episode#)';
    eb05.TextPrompt := 'Broadcaster';
    eb06.TextPrompt := 'Day Month';
    //
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    il1 := il1 + ')';
    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' '+eb03.Text;
    ref := ref + ' '+eb04.Text;
    ref := ref + ' '+eb05.Text;
    ref := ref + ' '+eb06.Text;
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgMovies.IsChecked then
  begin
    eb01.TextPrompt := 'Title of Movie';
    eb02.TextPrompt := 'Year of Production';
    eb03.TextPrompt := 'Director';
    eb04.TextPrompt := 'Format [DVD/STREAM/CINEMA]';
    eb05.TextPrompt := 'Place of Publication';
    eb06.TextPrompt := 'Publisher Name';
    eb07.TextPrompt := 'Reissue Year';
    eb08.TextPrompt := 'Reprint Year';
    //
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    il1 := il1 + ')';
    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    ref := ref + ' Directed by: '+eb03.Text;
    ref := ref + ' ['+eb04.Text+']';
    ref := ref + ' '+eb05.Text;
    ref := ref + ': '+eb06.Text;
    if eb07.Text >' ' then
    ref := ref + 'Reisssued: '+eb07.Text;
    if eb08.Text >' ' then
    ref := ref + 'Reprinted: '+eb08.Text;
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgBookCollected.IsChecked then
  begin
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Publication';
    eb04.TextPrompt := 'Edition';
    eb05.TextPrompt := 'Volumes';
    eb06.TextPrompt := 'Place of Publication';
    eb07.TextPrompt := 'Publisher Name';
    eb08.TextPrompt := 'Page: p. X|pp. X-Y';
    //
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    if eb08.Text > ' ' then
      if Pos('-', eb08.Text) > 0 then
        il1 := il1 + ', pp. ' + eb08.Text
      else
        il1 := il1 + ', p. ' + eb08.Text;
    il1 := il1 + ')';
    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    if eb03.Text >' ' then
      ref := ref + ' <i>'+eb03.Text+'</i>';
    if eb04.Text >' ' then
      ref := ref + ' '+eb04.Text+' ';
    if eb05.Text >' ' then
      ref := ref + ' ('+eb05.Text+' vols)';
    if eb06.Text >' ' then
      ref := ref + ' '+eb06.Text+' ';
    if eb07.Text >' ' then
      ref := ref + ' '+eb07.Text+' ';
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgBookChap.IsChecked then
  begin
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Chapter';
    eb04.TextPrompt := 'Editors';
    eb05.TextPrompt := 'Title of Publication';
    eb06.TextPrompt := 'Place of Publication';
    eb07.TextPrompt := 'Publisher Name';
    eb08.TextPrompt := 'Page: p. X|pp. X-Y';
    //
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    if eb08.Text > ' ' then
      if Pos('-', eb08.Text) > 0 then
        il1 := il1 + ', pp. ' + eb08.Text
      else
        il1 := il1 + ', p. ' + eb08.Text;
    il1 := il1 + ')';
    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    if eb03.Text >' ' then
      ref := ref + ' <qs>'+eb03.Text+'<qs>';
    if eb04.Text >' ' then
      ref := ref + ' in '+eb04.Text+' (eds)';
    if eb05.Text >' ' then
      ref := ref + ' <i>'+eb05.Text+'</i>';
    if eb06.Text >' ' then
      ref := ref + ' '+eb06.Text;
    if eb07.Text >' ' then
      ref := ref + ': '+eb07.Text;
    if eb08.Text > ' ' then
      if Pos('-', eb08.Text) > 0 then
        ref := ref + ', pp. ' + eb08.Text+'.'
      else
        ref := ref + ', p. ' + eb08.Text+'.';
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  if rgBookPartChap.IsChecked then
  begin
    eb01.TextPrompt := 'Author: Surname, Init.';
    eb02.TextPrompt := 'Year of Publication';
    eb03.TextPrompt := 'Title of Chapter';
    eb04.TextPrompt := 'Editors';
    eb05.TextPrompt := 'Title of Publication';
    eb06.TextPrompt := 'Place of Publication';
    eb07.TextPrompt := 'Publisher Name';
    eb08.TextPrompt := 'Page: p. X|pp. X-Y';
    //
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    if eb08.Text > ' ' then
      if Pos('-', eb08.Text) > 0 then
        il1 := il1 + ', pp. ' + eb08.Text
      else
        il1 := il1 + ', p. ' + eb08.Text;
    il1 := il1 + ')';
    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    if eb03.Text >' ' then
      ref := ref + ' <qs>'+eb03.Text+'<qs>';
    if eb04.Text >' ' then
      ref := ref + ' in '+eb04.Text+' (eds)';
    if eb05.Text >' ' then
      ref := ref + ' <i>'+eb05.Text+'</i>';
    if eb06.Text >' ' then
      ref := ref + ' '+eb06.Text;
    if eb07.Text >' ' then
      ref := ref + ': '+eb07.Text;
    if eb08.Text > ' ' then
      if Pos('-', eb08.Text) > 0 then
        ref := ref + ' Extract pp. ' + eb08.Text+'.'
      else
        ref := ref + ' Extract p. ' + eb08.Text+'.';
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;


  if st = 'BK:NOAU' then
  //procedure CIR_BOOKDR;
  //begin
  //	// Book chapter in digital repository
  //	//  ================================
  //	//  Surname, Initial.
  //	//  Year (in round brackets)
  //	//  Title of chapter (in single quotation marks)
  //	//  ‘in’ plus author/editor of book Initial. Surname
  //	//  Title of book (in italics)
  //	//  Version (in square brackets)
  //	//  Available at: URL (Accessed: date)
  //end;
  //

  if rgConfPaper.IsChecked then
  begin
  //	//Conference paper
  //	//  ================
  //	//  Surname, Initial.
  //	//  Year of publication (in round brackets)
  //	//  Title of paper (in single quotation marks)
  //	//  Title of conference (in italics)
  //	//  Organisation or company (if stated)
  //	//  Location and date of conference
  //	//  Available at: DOI or URL (Accessed: date)
    //
    il1 := '(' + eb01.Text + ', ' + eb02.Text;
    if eb08.Text > ' ' then
      if Pos('-', eb08.Text) > 0 then
        il1 := il1 + ', pp. ' + eb08.Text
      else
        il1 := il1 + ', p. ' + eb08.Text;
    il1 := il1 + ')';
    // citation
    ref := eb01.Text;
    if eb02.Text >' ' then
      ref := ref + ' ('+eb02.Text+')';
    if eb03.Text >' ' then
      ref := ref + ' <qs>'+eb03.Text+'<qs>';
    if eb04.Text >' ' then
      ref := ref + ' <i>'+eb04.Text+'</i> ';
    if eb05.Text >' ' then
      ref := ref + ' '+eb05.Text+' ';
    if eb06.Text >' ' then
      ref := ref + ' '+eb06.Text+' ';
    if eb07.Text >' ' then
      ref := ref + ' '+eb07.Text+' ';
    if EBOL01.Text > ' ' then
      ref := ref + ' Available at: ' + EBOL01.Text;
    if EBOL02.Text > ' ' then
      ref := ref + ' Last Updated: ' + EBOL02.Text;
    if EBOL03.Text > ' ' then
      ref := ref + ' (Accessed: ' + EBOL03.Text+').';
  end;

  CIR_ILR1.Text := il1;
  Memo2.lines.Clear;
  memo2.Lines.Add(ref);
  button3.Enabled:=True;
end;

end.
