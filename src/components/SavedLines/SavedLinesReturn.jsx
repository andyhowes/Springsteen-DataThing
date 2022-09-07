return (
  <div id="savedLinesBox">

    {linesStore.length === 0 || userStore.length === 0? (<p>...Loading...</p>) : (
    <section><div id="linesBox">
      <h1 className="linesCap">SAVED LINES</h1>
      <DragDropContext onDragEnd={handleOnDragEnd}>
        <Droppable droppableId="droppableIdForSavedLinesList">
          {(provided) => (
            <ul id="lineList" {...provided.droppableProps} ref={provided.innerRef}>
              {lines.map((line, index) => {
                let savedLineKey = index + 'a';
                return (
                  <Draggable key={savedLineKey} draggableId={savedLineKey} index={index}>
                  {(provided) =>
                  (<div key={index + 'div'} ref={provided.innerRef} {...provided.draggableProps} {...provided.dragHandleProps}>
                  <li key={index +'li'}><button className="deleteButton" onClick={()=>{deleteLine(line.saved_id)}}>⊖</button>
                  {line.fragment_text}</li></div>)}</Draggable>
                )
              })}
            </ul>
          )}
        </Droppable>
      </DragDropContext>
    </div></section>)}
  </div>
);