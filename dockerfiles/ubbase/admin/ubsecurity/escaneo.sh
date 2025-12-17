${INICIALES}jambscan({
    while true;
        jambload_ciber
        sleep 30
    done
})

main() {
    load_entrypoint_base
    jambscan &
}