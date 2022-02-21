component extends="cbwire.models.Component" {

    data = {
        "task": {}
    };

    function mount( event, rc, prc, parameters ) {
        data.task = parameters.task;
    }

    function remove() {
        this.emit( "removeTask", { "taskId": data.task.id  });
    }

    function complete() {
        this.emit( "completeTask", { "taskId": data.task.id  } );
    }

    function reopen(){
        this.emit( "reopenTask", { "taskId": data.task.id  } );
    }

}