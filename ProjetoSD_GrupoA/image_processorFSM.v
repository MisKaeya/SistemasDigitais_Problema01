//image processor fsm.v
//Modulo para a Maquina de Estados Finita (FSM) principal
//Responsavel por controlar o fluxo de processamento e redimensionamento da imagem.

module image_processor_FSM (
	
	//entradas do sistema
	input wire clk,    //sinal de clock principal
	input wire reset_n, //sinal de reset assincrono (ativo baixo)
	input wire btn_start,  //botao que inicia o processamento 
	input wire [1:0] sw mode, //chaves para selecionar o modo de operaçao (zoom/down scale)
	
	//saida para outros modulos
	output reg [2:0] current_state, //estado atual da maquina
	output reg start_fetch, //sinal para leitura de pixels
	output reg start_process, //sinal para iniciar o processamento
	output reg start_write,  //sinal que inicia a leitura de pixels 
	output reg processing_done, //sinal que indica o fim do processamento
	);
	
	//definiçao dos estados usando 'parameter' para ficar mais legivel 
	localparam IDLE = 3'b000;  //estado de espera
	localparam CONFIG	 = 3'b001;  //estado de configuraçao
	localparam FETCH = 3'b010;  //estado de leitura de pixels
	localparam PROCESS = 3'b011; //estado de processamento (zoom/reduçao)
	localparam WRITE = 3'b100;  //estado de escrita de pixels
	localparam DONE = 3'b101;  //estado de finalizaçao
	
	//
	---------------------------------------------------------------------------
	// Bloco de logica sequencial para fsm. Atualiza o estado em cada borda de subida de clock
		
		always @(posedge clk or negedge reset_n) begin
			if (!reset_n) begin
				//Reset assincrono
				current_state <= IDLE;
			end else begin
				// logica de transiçao de estado
				case (current_state)
					IDLE: begin
					// aguarda btn_start ser pressionado
						if (btn_start) begin current_state
		<=CONFIG;
						end else begin current_state
		<= IDLE;
						end
					end
					CONFIG: begin
	endmodule
	
	