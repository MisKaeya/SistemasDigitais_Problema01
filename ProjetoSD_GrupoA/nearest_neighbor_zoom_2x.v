//algoritmo de zoom in com o vizinho mais proximo
//a logica para 2x e identica a replicaçao de pixel, pois o pixe mais proximo de um bloco 2x2

module nearest_neighbor_zoom_2x (
		// entradas
		input wire clk,
		input wire reset_n,
		input wire start,
		input wire [7:0] pixel_in, //pixel de 8 bits na imagem de entrada
		
		// saidas
		output reg [7:0] pixel_out,    //pixel de 8 bits da iamgem de saida
		output reg done, //sinal de conclusao
		output reg [1:0] pixel_count //contador par os 4 pixels de saida
		
);

	//definiçao dos estados da fsm interna
	localparam IDLE_STATE = 2'b00;
	localparam GENERATE_PIXEL = 2'b01;
	localparam DONE_STATE = 2'b10;
	reg [1:0] state;  //registo do estado atual
	
	// logica da fsm
	always @(posedge clk or negedge reset_n) begin
		if (!reset_n) begin
			state <= IDLE_STATE;
			done <= 1'b0;
			pixel_count <= 2'b00;
		end else begin
			case (State)