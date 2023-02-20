component extends="cbwire.models.Component" {

    data = {
        "task": {}
    };

    function mount( event, rc, prc, parameters ) {
        data.task = parameters.task;
    }

    function remove() {
        this.emit( "removeTask", [ data.task.id ] );
    }

    function complete() {
        this.emit( "completeTask", [ data.task.id ] );
    }

    function reopen(){
        this.emit( "reopenTask", [ data.task.id ] );
    }

}