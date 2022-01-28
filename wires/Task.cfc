component extends="cbwire.models.Component" {

    variables.data = {
        "task": {}
    };


    function mount( event, rc, prc, parameters ) {
        variables.data.task = parameters.task;
    }

    function remove() {
        this.emit( "removeTask", { "taskId": variables.data.task.id  });
    }

    function complete() {
        this.emit( "completeTask", { "taskId": variables.data.task.id  } );
    }

    function reopen(){
        this.emit( "reopenTask", { "taskId": variables.data.task.id  } );
    }

}