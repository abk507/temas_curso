

function my_instance_index(){
	for(i = 0; i < instance_number(object_index); i++){
		aux = instance_find(object_index, i)
		if aux.id == self.id{
			return i;
			break;
		}
	}
}