component extends="cbwire.models.Component" {

    // Reactive data properties
    variables.data = {
        "tasks": [],
        "task": "",
        "error": ""
    };

    // Listen for events emitted using this.emit()
    variables.listeners = {
        "removeTask": "removeTask",
        "completeTask": "completeTask",
        "reopenTask": "reopenTask"
    };

    // Computed properties
    variables.computed = {
        "taskCounter": function() {
            return arrayLen( variables.data.tasks );
        },
        "completeCounter": function() {
            var completedTasks = variables.data.tasks.filter( function( task ){
                return task.complete == true;
            } );
            return arrayLen( completedTasks );
        },
        "preventAdd": function(){
            return len( variables.data.error ) || !len( variables.data.task );
        }
    }

    // Validations for our TaskList
    function validate(){
        this.setError( len( variables.data.task ) ? "" : "Please enter something else." );
    }

    // Runs once when our TaskList is first rendered.
    function mount() {
        validate();
    }

    // cbwire looks for "postUpdate[PropertyName]" and fires after the property is updated.
    function postUpdateTask() {
        validate();
    }

    // Add a task
    function addTask() {
        validate();

        if ( len( variables.data.error ) ){
            return;
        }

        variables.data.tasks.append( {
            "id": createUUID(),
            "name": variables.data.task,
            "complete": false
        } );

        variables.data.task = "";
    }

    // Remove a task
    function removeTask( taskId ) {
        variables.data.tasks = variables.data.tasks.filter( function( checkTask ) {
            return checkTask.id != taskId;
        } );
    }

    // Complete a task
    function completeTask( taskId ) {
        flagTask( taskId=taskId, isCompleted=true );
    }

    // Remove all tasks
    function removeAll() {
        variables.data.tasks = [];
    }

    // Reopen a completed task
    function reopenTask( taskId ) {
        flagTask( taskId=taskId, isCompleted=false );
    }

    // Flag is task either completed or not
    function flagTask( taskId, isCompleted ) {
        var match = variables.data.tasks.filter( function( checkTask ) {
            return checkTask.id == taskId;
        } );

        if ( arrayLen( match ) == 1 ) {
            match[ 1 ].complete = isCompleted;
        }
    }

}