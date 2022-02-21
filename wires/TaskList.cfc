component extends="cbwire.models.Component" {

    // Data Properties
    data = {
        "tasks": [],
        "task": "",
        "error": ""
    };

    // Event Listeners
    listeners = {
        "removeTask": "removeTask",
        "completeTask": "completeTask",
        "reopenTask": "reopenTask"
    };

    // Computed Properties
    computed = {
        "taskCounter": function() {
            return arrayLen( data.tasks );
        },
        "completeCounter": function() {
            var completedTasks = data.tasks.filter( function( task ){
                return task.complete == true;
            } );
            return arrayLen( completedTasks );
        },
        "preventAdd": function(){
            return len( data.error ) || !len( data.task );
        }
    }

    // Validations for our TaskList
    function validate(){
        this.setError( len( data.task ) ? "" : "Please enter something else." );
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

        if ( len( data.error ) ){
            return;
        }

        data.tasks.append( {
            "id": createUUID(),
            "name": data.task,
            "complete": false
        } );

        data.task = "";
    }

    // Remove a task
    function removeTask( taskId ) {
        data.tasks = data.tasks.filter( function( checkTask ) {
            return checkTask.id != taskId;
        } );
    }

    // Complete a task
    function completeTask( taskId ) {
        flagTask( taskId=taskId, isCompleted=true );
    }

    // Remove all tasks
    function removeAll() {
        data.tasks = [];
    }

    // Reopen a completed task
    function reopenTask( taskId ) {
        flagTask( taskId=taskId, isCompleted=false );
    }

    // Flag is task either completed or not
    function flagTask( taskId, isCompleted ) {
        var match = data.tasks.filter( function( checkTask ) {
            return checkTask.id == taskId;
        } );

        if ( arrayLen( match ) == 1 ) {
            match[ 1 ].complete = isCompleted;
        }
    }

}