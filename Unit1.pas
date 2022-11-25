unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)

    Button_Adicionar    : TButton;
    Button_Multiplicar  : TButton;
    Button_Limpar       : TButton;
    Button_Subtrair     : TButton;
    Button_Resultado    : TButton;
    Button_Dividir      : TButton;

    Button_Ponto: TButton;
    Button_0: TButton;
    Button_1: TButton;
    Button_2: TButton;
    Button_3: TButton;
    Button_4: TButton;
    Button_5: TButton;
    Button_6: TButton;
    Button_7: TButton;
    Button_8: TButton;
    Button_9: TButton;

    Edit_Display  : TEdit;
    Edit_Display2 : TEdit;


    procedure Button_0Click(Sender: TObject);
    procedure Button_1Click(Sender: TObject);
    procedure Button_2Click(Sender: TObject);
    procedure Button_3Click(Sender: TObject);
    procedure Button_4Click(Sender: TObject);
    procedure Button_5Click(Sender: TObject);
    procedure Button_6Click(Sender: TObject);
    procedure Button_7Click(Sender: TObject);
    procedure Button_8Click(Sender: TObject);
    procedure Button_9Click(Sender: TObject);

    procedure Button_AdicionarClick(Sender: TObject);
    procedure Button_SubtrairClick(Sender: TObject);
    procedure Button_MultiplicarClick(Sender: TObject);
    procedure Button_DividirClick(Sender: TObject);

    procedure Button_ResultadoClick(Sender: TObject);
    procedure Button_PontoClick(Sender: TObject);
    procedure Button_LimparClick(Sender: TObject);
    procedure AtualizarResutados(valor1, op, valor2, resuldado : String);
    procedure ValorDaParcela1();

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  parcela1, parcela2, Op, resultado : String;

implementation

{$R *.dfm}

Procedure Display(valor : String);
var intermediario : String;
begin
  intermediario := Form1.Edit_Display.text + valor;
  Form1.Edit_Display.text :=  intermediario;
end;

Procedure DisplayValorAnterios(resultado, operacao : String);
begin
  Form1.Edit_Display2.text := parcela1 + operacao;
  Form1.Edit_Display.text := '';
end;

{$REGION 'Botoes de 0 a 9 e ponto'}

procedure TForm1.Button_PontoClick(Sender: TObject);
begin
  Display(',');
end;

procedure TForm1.Button_0Click(Sender: TObject);
begin
  Display('0');
end;

procedure TForm1.Button_1Click(Sender: TObject);
begin
  Display('1');
end;

procedure TForm1.Button_2Click(Sender: TObject);
begin
  Display('2');
end;

procedure TForm1.Button_3Click(Sender: TObject);
begin
  Display('3');
end;

procedure TForm1.Button_4Click(Sender: TObject);
begin
  Display('4');
end;

procedure TForm1.Button_5Click(Sender: TObject);
begin
  Display('5');
end;

procedure TForm1.Button_6Click(Sender: TObject);
begin
  Display('6');
end;

procedure TForm1.Button_7Click(Sender: TObject);
begin
  Display('7');
end;


procedure TForm1.Button_8Click(Sender: TObject);
begin
  Display('8');
end;

procedure TForm1.Button_9Click(Sender: TObject);
begin
  Display('9');
end;

{$ENDREGION}

{$REGION 'Boteos de opracao'}

procedure TForm1.Button_DividirClick(Sender: TObject);
begin
  Op :=  ' / ';
  ValorDaParcela1();
  DisplayValorAnterios(parcela1, Op);

end;

procedure TForm1.Button_MultiplicarClick(Sender: TObject);
begin
  Op := ' * ';
  ValorDaParcela1();
  DisplayValorAnterios(parcela1, Op);

end;

procedure TForm1.Button_SubtrairClick(Sender: TObject);
begin
  Op := ' - ';
  ValorDaParcela1();
  DisplayValorAnterios(parcela1,Op);

end;

procedure TForm1.Button_AdicionarClick(Sender: TObject);
begin
  Op := ' + ';
  ValorDaParcela1();
  DisplayValorAnterios(parcela1, Op);

end;

{$ENDREGION}

procedure TForm1.Button_ResultadoClick(Sender: TObject);

begin
  parcela2 := Edit_Display.Text;

 if Op = ' + ' then
  Resultado := FloatToStr( StrToFloat(parcela1) + StrToFloat(parcela2) );
 if Op = ' - ' then
  Resultado := FloatToStr( StrToFloat(parcela1) - StrToFloat(parcela2) );
 if Op = ' / ' then
  Resultado := FloatToStr( StrToFloat(parcela1) / StrToFloat(parcela2) );
 if Op = ' * ' then
  Resultado := FloatToStr( StrToFloat(parcela1) * StrToFloat(parcela2) );

  AtualizarResutados(parcela1, Op, parcela2, Resultado);
end;

procedure TForm1.Button_LimparClick(Sender: TObject);
begin
  Edit_Display.Text := '';
  Edit_Display2.Text  := '';
end;

procedure TForm1.AtualizarResutados(valor1, op, valor2, resuldado : String);
begin
  Edit_display.Text := '';
  Edit_display2.Text := valor1 + op + valor2 + ' = ' + resultado;
  parcela1 := resuldado;
end;

procedure TForm1.ValorDaParcela1();
Begin
  if resultado = '' then
    parcela1 := copy(Edit_Display.Text,0, length(Edit_Display.Text))
  else
    parcela1 := resultado;


End;
end.
